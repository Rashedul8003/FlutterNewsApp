import 'package:flutter/material.dart';
import 'package:news_app/news_form_Api/home_news.dart';
import 'package:news_app/news_from_json/home_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: NewsClass(),
      home: HomeNewss(),
    );
  }
}

class HomeNewss extends StatelessWidget {
  const HomeNewss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(title: const Text('News App'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const HomeNews(),
                      ));
                },
                title: const Text('Api News'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const NewsClass(),
                      ));
                },
                title: const Text('Json News'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
