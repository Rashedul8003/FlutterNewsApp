import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle11;
import 'package:news_app/news_from_json/model/news_model.dart';

class MoreNews extends StatefulWidget {
  String id;

  MoreNews({
    required this.id,
  });

  @override
  State<MoreNews> createState() => _MoreNewsState();
}

class _MoreNewsState extends State<MoreNews> {
  NewsModel? newsModel1;
  Future<List<NewsModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle11.rootBundle.loadString('assets/news.json');
    List list = json.decode(jsondata);
    return list.map((e) => NewsModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, value) {
            if (value.hasError) {
              return Center(child: Text("${value.error}"));
            } else if (value.hasData) {
              var items = value.data as List<NewsModel>;

              for (var i = 0; i < items.length; i++) {
                if (items[i].id.toString() == widget.id) {
                  newsModel1 = items[i];
                  print('done');
                  break;
                }
              }
              if (newsModel1 != null) {
                return Scaffold(
                  appBar: AppBar(
                      title: Text(newsModel1!.name.toString()),
                      centerTitle: true),
                  body: Container(
                    margin: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            //height: MediaQuery.of(context).size.height / 2,
                            child: Image(
                                image: NetworkImage(
                              newsModel1!.urlToImage.toString(),
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Text('Author : ' +
                                      newsModel1!.author.toString())),
                              Text(newsModel1!.publishedAt.toString()),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(newsModel1!.description.toString()),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                Text("item not found");
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
