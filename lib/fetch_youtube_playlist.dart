import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sks_news/new.dart';

class Fetch_playlist extends StatefulWidget {
  @override
  _Fetch_playlistState createState() => _Fetch_playlistState();
}

class _Fetch_playlistState extends State<Fetch_playlist> {


  Future<List> getData() async{
    final respone = await http.get("https://sksnews247.herokuapp.com/");
    return json.decode(respone.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasError) print(snapshot.error);
            return Center(
              child: snapshot.hasData
              ? ListVideo(list: snapshot.data,)
              : CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}


class ListVideo extends StatelessWidget {

  List list;
  ListVideo({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list==null?0:list.length,
        itemBuilder: (context, i){
          String url = list[i]['snippet']['resourceId']['videoId'];
          String title = list[i]['snippet']['title'];
          if(title == 'Private video'){
            return Container(
              child: Text(""),
            );
          }
          else{
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>New(url: url,)));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.network(list[i]['snippet']['thumbnails']['high']['url']),
                    Text(title,style: TextStyle(
                      fontSize: 20
                    ),),
                    SizedBox(height: 2,),
                    Divider(),
                    SizedBox(height: 2,)
                  ],
                ),
              ),
            );

          }
      }
    );
  }
}
