import 'package:flutter/material.dart';
import 'package:news_app/news_form_Api/api_service.dart';
import 'package:news_app/news_form_Api/list_news.dart';

class BrekingNews extends StatefulWidget {
  const BrekingNews({Key? key}) : super(key: key);

  @override
  State<BrekingNews> createState() => _BrekingNeState();
}

class _BrekingNeState extends State<BrekingNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getBrekingNews(),
          builder: (context, value) {
            if (value.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (value.hasData) {
              return ListView.builder(
                itemCount: value.data!.length,
                itemBuilder: (context, index11) {
                  return NewsList(modelNewsApi: value.data![index11]);
                },
              );
            } else if (value.hasError) {
              return Text("something went wrong");
            }
            return SizedBox.shrink();
          }),
    );
  }
}
