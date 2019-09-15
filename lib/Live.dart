import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:sks_news/Live_val.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> with TickerProviderStateMixin{


  Future<Live_val> fun() async{
      final response = await http.get("https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCt4t-jeY85JegMlZ-E5UWtA&eventType=live&type=video&key=AIzaSyAp2JO-vbUi_0AoturLhcDVkLZGDHj3sNc");
      print(response.body);
      if(response.statusCode==200){
        print(response.body.toString());
        return Live_val.fromJson(json.decode(response.body));
      }

      else
        {
          throw Exception('Failed to load');
          //var jsonnn = json.decode(response.body);
          //print(jsonnn['items'][0]['id']['videoId']);
          //var extractor = YouTubeExtractor();
          //var streamInfo = await extractor.getMediaStreamsAsync((jsonnn['items'][0]['id']['videoId']).toString());

          // Print the audio stream url
          //print('Audio URL: ${streamInfo.audio.first.url}');

          //print(jsonnn['items'][0]['snippet']);
          //return jsonnn['items'][0]['id']['videoId'];
          //return response.body;
        }
  }
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    fun();
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.live_tv),
            ),
            FadeTransition(
              opacity: animation,
              child: Text("Live", style: TextStyle(color: Colors.red),),
            ),
          ],
        ),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>extra()));
        }),
        Text("SKS News Gwalior", style: TextStyle(
          fontSize: 25
        ),),
        Text("Slide -> to Videos")
      ],
    ));/*ListView(
      children: <Widget>[
        FutureBuilder<Live_val>(
            future: fun(),
            builder: (context, snapshot){
              //var jsonn = snapshot.data;
              //print(snapshot.data);
              if(snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? Video(data: snapshot.data,)
                  : CircularProgressIndicator();
            }
        ),
      ],
    );
*/
    /*WebviewScaffold(url: 'https://www.youtube.com/watch?v=eYo09GEuHdY', appBar: AppBar(
      title: Text("njskdln"),
    ),);*/
    
  }
}

class extra extends StatelessWidget {
  Live_val data;

  extra({this.data});

  @override
  VideoPlayerController _controller;
  Widget build(BuildContext context) {
    return Container(
      child: WebviewScaffold(
        url: 'https://www.youtube.com/embed/live_stream?channel=UCes_O3VeiM5BnONBRz5k9pA',
        /*FlutterYoutube.playYoutubeVideoById(
          apiKey: "AIzaSyARf6UOCAMrldtBV1jFTWbotWlQKGFmhpg",
          videoId: 'ESvIdJCMJIA',
          autoPlay: true, //default falase
          fullScreen: true //default false
      ),*/
    ));/*WebviewScaffold(
        url: 'https://www.youtube.com/embed/live_stream?channel=UCes_O3VeiM5BnONBRz5k9pA',
      appBar: AppBar(
        title: Text('Live'),
        elevation: 10,
        backgroundColor: Colors.red,
        centerTitle: true,
        automaticallyImplyLeading: true,

      ),
      resizeToAvoidBottomInset: true,
      withJavascript: true,

    );*/
  }
}



class Video extends StatefulWidget {


  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {

  VideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayer(
        context: context,
        source: 'https://www.youtube.com/channel/UCes_O3VeiM5BnONBRz5k9pA/live',
        isLive: true,
        quality: YoutubeQuality.HD,
        playerMode: YoutubePlayerMode.DEFAULT,
        // callbackController is (optional).
        // use it to control player on your own.
        callbackController: (controller) {
          _controller = controller;
        },
      ),
    );
  }
}

