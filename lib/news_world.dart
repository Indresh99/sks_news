import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sks_news/yout.dart';
import 'fetch_news.dart';

class NewsListPage extends StatefulWidget {

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  Future<List<Article>> getData(String newsType) async {
    List<Article> list;
    String link =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=fde3c357d6394c9d9ffcc24eb1913412";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["articles"] as List;
      print(rest);
      list = rest.map<Article>((json) => Article.fromJson(json)).toList();
    }
    print("List Size: ${list.length}");
    return list;
  }

  Widget listViewWidget(List<Article> article) {
    return Container(
      child: ListView.builder(
          itemCount: 20,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return Card(
              elevation: 20,
              child: ListTile(
                title: Text(
                  '${article[position].title}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: article[position].urlToImage == null
                        ? Image(
                      image: AssetImage('images/no_image_available.png'),
                    )
                        : Image.network('${article[position].urlToImage}'),

                  ),
                ),
                onTap: () => _onTapItem(context, article[position]),
              ),
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>View(url: '${article.url}',)));



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Top Headlines"),
      ),
      body: FutureBuilder(
          future: getData(""),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}