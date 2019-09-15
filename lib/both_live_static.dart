import 'package:flutter/material.dart';
import 'package:sks_news/Live.dart';
import 'package:sks_news/fetch_youtube_playlist.dart';
import 'package:flutter/material.dart';
import 'package:sks_news/yout.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'news_world.dart';



class Both extends StatefulWidget {
  @override
  _BothState createState() => _BothState();
}

class _BothState extends State<Both> {


  List<Widget> containers = [
    Live(),
    Fetch_playlist()
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backPress,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsListPage()));
              },
            backgroundColor: Colors.red,
              child: Icon(Icons.crop_square),
          ),
          appBar: AppBar(
            backgroundColor: Colors.red,
            elevation: 20,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.person_pin, color: Colors.white,), onPressed: (){_showReview(context, "");}),
              //IconButton(icon: Icon(Icons.exit_to_app,color: Colors.white,), onPressed: (){_dialog();}),
            ],
            title: Text("SKS News"),
            bottom: TabBar(
              indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(text: "Live",),
                  Tab(text: "Local News Gwalior",),

                ]
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    child: DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
/*
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.teal,
                              radius: 25.0,
                              backgroundImage: AssetImage('assests/sks_new.png'),
                            ),
                          ),

                          Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 12,
                            color: Colors.redAccent,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: 50,
                                  maxWidth: 800
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Sks News 24*7", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                    ),),
                                    Text("sksgwalior9@gmail.com", style: TextStyle(
                                        color: Colors.white
                                    ),)

                                  ],
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assests/sks_new.png'),
                              fit: BoxFit.fill)
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: StadiumBorder(),
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Welcome to the SKS News 24*7", style: TextStyle(
                          fontSize: 18,
                          color: Colors.black
                      ),)
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>View(url: 'https://timesofindia.indiatimes.com/news',)));
                  },
                  child: ListTile(
                    title: Text("Times Of India"),
                    leading: Icon(Icons.ac_unit),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>View(url: 'https://www.hindustantimes.com/',)));
                  },
                  child: ListTile(
                    title: Text("Hindustan Times"),
                    leading: Icon(Icons.ac_unit),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsListPage()));
                  },
                  child: ListTile(
                    title: Text("Top Headlines"),
                    leading: Icon(Icons.ac_unit),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: containers),
        ),
      ),
    );
  }



Future<bool> _backPress() {
  return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text("Do you want to Exit"),
            actions: <Widget>[
              FlatButton(onPressed: () => Navigator.pop(context, false),
                  child: Text("No", style: TextStyle(color: Colors.black),)),
              FlatButton(onPressed: () => Navigator.pop(context, true),
                  child: Text("Yes", style: TextStyle(color: Colors.black),))
            ],
          )
  );
}

_dialog() {
  return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text("Do you want to Exit"),
            actions: <Widget>[
              FlatButton(onPressed: () => Navigator.pop(context, false),
                  child: Text("No", style: TextStyle(color: Colors.black),)),
              FlatButton(onPressed: () => Navigator.pop(context, true),
                  child: Text("Yes", style: TextStyle(color: Colors.black),))
            ],
          )
  );
}

Future<bool> _showReview(context, review) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 250.0,
              width: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 10.0,
                      ),
                      /*Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)
                            ),
                            color: Colors.teal
                        ),
                      ),*/
                      /*Positioned(
                          top: 50.0,
                          left: 94.0,
                          child: Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(45.0),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2.0
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage('assests/po.jpeg'),
                                      fit: BoxFit.cover
                                  )
                              )
                          )
                      )*/
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text("SKS News 24*7", style: TextStyle(
                        fontFamily: 'Times',
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300
                    ),),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("नजरिया बदलो, दुनिया बदलेगी", style: TextStyle(
                        fontFamily: 'Times',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /*Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: (){
                                _open("https://www.instagram.com/indresh._.mahor/");
                              },
                              child: CircleAvatar(
                                child: Image(image: AssetImage('assests/insta.png')),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: (){
                                _open("https://www.linkedin.com/in/indresh-mahor-a49680133/");
                              },
                              child: CircleAvatar(
                                child: Image(image: AssetImage('assests/linked.png')),
                              ),
                            ),
                          ),*/
//                        Padding(
//                          padding: const EdgeInsets.all(4.0),
//                          child: InkWell(
//                            onTap: () {
//                              UrlLauncher.launch(
//                                  "mailto:<indreshmahor99@gmail.com>?subject=News&body=New%20plugin");
//                            },
//                            child: CircleAvatar(
//                              child: Image(
//                                  image: AssetImage('assests/gmail.png')),
//                            ),
//                          ),
//                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: () {
                              _open("whatsapp://send?phone=919131599341");
                            },
                            child: CircleAvatar(
                              child: Image(
                                  image: AssetImage('assests/whatsapp.png')),
                            ),
                          ),
                        ),
                        /*Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: (){
                                _open("https://www.facebook.com/indresh.mahor");
                              },
                              child: CircleAvatar(
                                child: Image(image: AssetImage('assests/facebook.png')),
                              ),
                            ),
                          ),*/
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        int p = int.parse("9131599341");
                        UrlLauncher.launch("tel:$p");
                      },
                      child: Padding(padding: EdgeInsets.all(8.0),child: Icon(Icons.call))),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("Sks news 24*7 providing all current news of Gwalior, or related to sports, world affairs.", style: TextStyle(
                          fontSize: 12
                      ),),
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      }
  );
}
_open(url) async {

  if (await UrlLauncher.canLaunch(url)) {
    await UrlLauncher.launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



}

