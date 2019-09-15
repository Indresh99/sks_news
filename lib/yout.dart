import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class View extends StatefulWidget {

  String url;
  View({this.url});


  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebviewScaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 20,
          title: Text("Sks News"),
        ),
        url: widget.url,


      ),
    );
  }
}
