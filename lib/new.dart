import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'fetch_youtube_playlist.dart';
import 'package:youtube_player/youtube_player.dart';

class New extends StatefulWidget {
  String url;
  New({this.url});

  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {

  VideoPlayerController _videoController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("youtube"),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                  child: FlutterYoutube.playYoutubeVideoById(
                  apiKey: "AIzaSyARf6UOCAMrldtBV1jFTWbotWlQKGFmhpg",
                  videoId: widget.url,
                  autoPlay: true,
                  fullScreen: true,

              )),/*YoutubePlayer(
                          context: context,
                  source: widget.url,
                  playerMode: YoutubePlayerMode.NO_CONTROLS,
                  callbackController: (controller) {
                    _videoController = controller;
                  }, quality: YoutubeQuality.LOW,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.pause, color: Colors.white,), onPressed: (){_videoController.pause();}
                    ),
                    IconButton(
                        icon: Icon(Icons.play_arrow, color: Colors.white,), onPressed: (){_videoController.play();}
                    ),
                    IconButton(
                        icon: Icon(Icons.play_arrow, color: Colors.white,), onPressed: (){_videoController.play();}
                    ),

                  ],
                ),
              ),
*/
            ],
          ),
          //MaterialButton(child: Text("hello") ,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Fetch_playlist()));})
        ],
      )
    );
  }
}