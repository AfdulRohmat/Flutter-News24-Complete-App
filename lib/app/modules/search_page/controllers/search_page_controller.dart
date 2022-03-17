import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/app/data/models/search_articles_model.dart';
import 'package:flutter_news_app/app/data/services/search_news_api.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final TextEditingController searchContr = TextEditingController();

  var textSearch = ''.obs;

  List<SearchArticlesModel> searchedArticle =
      List<SearchArticlesModel>.empty(growable: true).obs;

  var isLoading = true.obs;

  void changeTextFromTextField(valueParam) {
    searchContr.text = valueParam;
  }

  @override
  void onInit() {
    searchContr;
    searchContr.clear();
    super.onInit();
  }

  Future<List<SearchArticlesModel>> fetchSearchArticles(String query) async {
    try {
      var articleSearchedFromAPI = await SearchNewsAPI.getNewsFromAPI(query);

      if (articleSearchedFromAPI != null) {
        searchedArticle = articleSearchedFromAPI;
        //
      }

      return articleSearchedFromAPI;
      //
    } catch (e) {
      throw Exception(e);
      //
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    searchContr.dispose();
    super.onClose();
  }
}
