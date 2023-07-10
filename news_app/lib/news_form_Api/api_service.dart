import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/news_form_Api/Model/model_news.dart';

class ApiService {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=*&apiKey=4ebc144ba1d845e192540df6bd2526cd";

  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=4ebc144ba1d845e192540df6bd2526cd";

  Future<List<ModelNewsApi>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<ModelNewsApi> articlesbody =
            body.map((e) => ModelNewsApi.fromJson(e)).toList();
        return articlesbody;
      } else {
        throw 'No news found';
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<ModelNewsApi>> getBrekingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<ModelNewsApi> articlesbody =
            body.map((e) => ModelNewsApi.fromJson(e)).toList();
        return articlesbody;
      } else {
        throw 'No news found';
      }
    } catch (e) {
      throw e;
    }
  }
}
