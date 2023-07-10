import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_form_Api/Model/model_news.dart';
import 'package:news_app/news_form_Api/details_news.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.modelNewsApi}) : super(key: key);
  final ModelNewsApi modelNewsApi;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shadowColor: Colors.black,
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsNews(modelNewsApi: modelNewsApi)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(modelNewsApi.title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            Padding(
                padding: EdgeInsets.all(6),
                child: Text('Written by ' + modelNewsApi.author.toString())),
            CachedNetworkImage(
              fit: BoxFit.contain,
              width: double.infinity,
              height: 250,
              imageUrl: modelNewsApi.urlToImage.toString(),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(modelNewsApi.source!.name.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(modelNewsApi.publishedAt ?? ""),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
