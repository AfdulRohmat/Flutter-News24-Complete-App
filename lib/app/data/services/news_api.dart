import 'dart:convert';

import 'package:flutter_news_app/app/data/models/news_articles_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsAPI {
  static Future<List<NewsArticlesModel>> getNewsFromAPI(
      String categoryParam) async {
    List<NewsArticlesModel> results = [];
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&category=$categoryParam&apiKey=3413f57c9dc646aa93b4927deaa39dd5');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // must be seperate one by one with for each() and add each item into a new List
      Map data = jsonDecode(response.body);

      List _temp = [];

      for (var item in data['articles']) {
        _temp.add(item);
      }

      results = _temp.map((json) => NewsArticlesModel.fromJson(json)).toList();

      return results;
    } else {
      throw Exception();
    }
  }
}
