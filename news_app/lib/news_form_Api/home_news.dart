import 'package:flutter/material.dart';
import 'package:news_app/news_form_Api/all_news.dart';
import 'package:news_app/news_form_Api/breaking_news.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('News From Api'),
            bottom: const TabBar(
              tabs: [
                Text('Breking News'),
                Text('All News'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              BrekingNews(),
              AllNews(),
            ],
          ),
        ));
  }
}
