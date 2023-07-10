import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_form_Api/Model/model_news.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsNews extends StatelessWidget {
  final ModelNewsApi modelNewsApi;
  const DetailsNews({Key? key, required this.modelNewsApi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(modelNewsApi.source!.name.toString()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                fit: BoxFit.fitWidth,
                width: double.infinity,
                // height: 250,
                imageUrl: modelNewsApi.urlToImage.toString(),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text(modelNewsApi.title.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  //    mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child:
                          Text('Written by ' + modelNewsApi.author.toString()),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(modelNewsApi.publishedAt.toString()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text(modelNewsApi.description.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        final Uri _url = Uri.parse(modelNewsApi.url.toString());
                        if (!await launchUrl(_url,
                            mode: LaunchMode.externalNonBrowserApplication)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Text("Read More...")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
