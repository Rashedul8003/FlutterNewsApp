import 'package:flutter/material.dart';
import 'package:news_app/news_form_Api/Model/model_news.dart';
import 'package:news_app/news_form_Api/api_service.dart';
import 'package:news_app/news_form_Api/list_news.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNews();
}

class _AllNews extends State<AllNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getAllNews(),
          builder: (context, value) {
            if (value.hasData) {
              List<ModelNewsApi> brekibgValue = value.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index11) {
                  return NewsList(modelNewsApi: brekibgValue[index11]);
                },
                itemCount: brekibgValue.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
