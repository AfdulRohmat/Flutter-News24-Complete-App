import 'dart:convert';

import 'package:flutter_news_app/app/data/models/search_articles_model.dart';
import 'package:http/http.dart' as http;

class SearchNewsAPI {
  static Future<List<SearchArticlesModel>> getNewsFromAPI(String query) async {
    List<SearchArticlesModel> results = [];

    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&q=$query&apiKey=3413f57c9dc646aa93b4927deaa39dd5');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // must be seperated one by one with for each() and add each item into a new List
      Map data = jsonDecode(response.body);

      List _temp = [];

      for (var item in data['articles']) {
        _temp.add(item);
      }

      results =
          _temp.map((json) => SearchArticlesModel.fromJson(json)).toList();

      return results;
    } else {
      throw Exception();
    }
  }
}
