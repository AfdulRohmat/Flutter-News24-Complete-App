import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/data/models/news_articles_model.dart';
import 'package:flutter_news_app/app/data/services/news_api.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  List<NewsArticlesModel> newsArticles = <NewsArticlesModel>[].obs;

  // instansiasi firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // variable to handle data is already in Firestore or Not
  var articleIsAlreadyBookmarked;

  bool isBookmarked = false;

  @override
  void onInit() {
    // fetchNewsArticles();
    isBookmarked;
    super.onInit();
  }

  // ON REFREDH FUNCTION
  Future<void> refreshDataFromAPI(String tipeParam) async {
    await NewsAPI.getNewsFromAPI(tipeParam);
    print("refresh data. Category : $tipeParam");
    update();
  }

  // ADD DATA ARTICLES TO FIRESTORE
  void addArticleToFirestore(
    String authorParam,
    String titleParam,
    String imgParam,
    String urlParam,
    String publishedAtParam,
    String? categoryParam,
    String detailDataParam,
    bool isBookmarkedParam,
  ) async {
    //instance CollectionReference
    CollectionReference articles = firestore.collection('articles');

    String dateNow = DateTime.now().toString();

    try {
      await articles.add({
        "author": authorParam,
        "category": categoryParam,
        "detailData": detailDataParam,
        "img": imgParam,
        "isBookmarked": isBookmarkedParam,
        "publishedAt": publishedAtParam,
        "title": titleParam,
        "url": urlParam,
        "time": dateNow,
        "id": "",
      }).then((value) {
        print("article added ");
      }).catchError((error) => print("Failed to add user: $error"));

      Get.defaultDialog(
        title: 'Succeed',
        titleStyle: TextStyle(
          color: cBlack,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        middleText: 'Article Successfully added to Bookmark',
        middleTextStyle: TextStyle(
          color: cGrey,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        backgroundColor: cWhite,
        radius: 10,
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(30, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: cWhite,
              onPrimary: cBlack,
              elevation: 0,
            ),
            child: DefaultText(
              text: 'Ok',
              fontSize: 14,
              textColor: cBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
      update();
      //
    } catch (e) {
      print(e);
    }
  }

  // CHECK IF DATA ALREADY BOOKMARKED INTO FIRESTORE OR NOT
  // AND THAN ADD IT IF NOT,
  Future checkDataAlreadyExistInFirestroe(
    String authorParam,
    String titleParam,
    String imgParam,
    String urlParam,
    String publishedAtParam,
    String? categoryParam,
    String detailDataParam,
    bool isBookmarkedParam,
  ) async {
    try {
      // FIRESTORE CHECK
      var articles = await firestore
          .collection('articles')
          .where("url", isEqualTo: urlParam)
          .limit(1)
          .get();

      // HANDLE IF ARTICLE ALREADY BOOKMARKED
      if (articles.docs.length == 1) {
        articleIsAlreadyBookmarked = true;
        Get.defaultDialog(
          title: 'Failed',
          titleStyle: TextStyle(
            color: cBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          middleText: 'Article is already Bookmarked',
          middleTextStyle: TextStyle(
            color: cGrey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          backgroundColor: cWhite,
          radius: 10,
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'Ok',
                fontSize: 14,
                textColor: cBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );

        //
      }
      // HANDLE IF ARTICLE NOT BOOKMARKED
      else {
        articleIsAlreadyBookmarked = false;
        Get.defaultDialog(
          title: 'Bookmark Article',
          titleStyle: TextStyle(
            color: cBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          middleText: 'Adding article to the Bookmark ?',
          middleTextStyle: TextStyle(
            color: cGrey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          backgroundColor: cWhite,
          radius: 10,
          actions: [
            // ==> YES ADD TO BOOKMARK
            ElevatedButton(
              onPressed: () {
                isBookmarkedParam = true;
                // ADD DATA TO FIREBASE FIRESTORE
                addArticleToFirestore(
                  authorParam,
                  titleParam,
                  imgParam,
                  urlParam,
                  publishedAtParam,
                  categoryParam,
                  urlParam,
                  isBookmarkedParam,
                );

                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'Yes',
                fontSize: 14,
                textColor: cBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 16),
            //
            // // ==> NO ADD TO BOOKMARK
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(30, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: cWhite,
                onPrimary: cBlack,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'No',
                fontSize: 14,
                textColor: cGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }

      print(
        "articleIsAlreadyBookmarked : " + articleIsAlreadyBookmarked.toString(),
      );

      print("aticle : " + articles.docs.length.toString());

      update();

      //
    } catch (e) {
      print(e);
    }
  }
}
