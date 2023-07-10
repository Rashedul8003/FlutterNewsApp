import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle11;
import 'package:news_app/news_from_json/model/news_model.dart';
import 'package:news_app/news_from_json/more_news.dart';

class NewsClass extends StatefulWidget {
  const NewsClass({Key? key}) : super(key: key);

  @override
  State<NewsClass> createState() => _NewsClassState();
}

class _NewsClassState extends State<NewsClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: Text(
            'News Paper',
          ),
          centerTitle: true),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<NewsModel>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    // color: Colors.green,
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: InkWell(
                      onTap: () {
                        String id = items[index].id.toString();
                        print('ItemId $id');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MoreNews(
                                      id: id,
                                    )));
                      },
                      child: Container(
                        //height: 120,
                        color: Colors.white60,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      //barrierColor: Colors.transparent,
                                      context: context,
                                      builder: (builder) => AlertDialog(
                                            contentPadding: EdgeInsets.zero,
                                            content: InkWell(
                                              onDoubleTap: () =>
                                                  Navigator.pop(context),
                                              child: Image(
                                                image: NetworkImage(items[index]
                                                    .urlToImage
                                                    .toString()),
                                                height: 360,
                                                width: 180,
                                                //   color: Colors.transparent,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ));
                                  print('Inkwell Image');
                                },
                                child: Image(
                                  image: NetworkImage(
                                      items[index].urlToImage.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.all(2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      items[index].title.toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 3,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      'Author : ' +
                                          items[index].author.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                        'News : ' +
                                            items[index].name.toString(),
                                        style: TextStyle(color: Colors.indigo),
                                        maxLines: 1),
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      items[index].publishedAt.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            // show circular progress while data is getting fetched from json file
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List> ReadJsonData() async {
    //read json file
    final jsondata =
        await rootBundle11.rootBundle.loadString('assets/news.json');
    //decode json data as list
    List list = json.decode(jsondata);
//return Future.error('err');
    //map json and initialize using DataModel
    return list.map((e) => NewsModel.fromJson(e)).toList();
  }
}
