import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/data/models/news_articles_model.dart';
import 'package:flutter_news_app/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../bookmark_page/controllers/bookmark_page_controller.dart';

class NewsTile extends StatefulWidget {
  final String author;
  final String title;
  final String img;
  final String url;
  final String publishedAt;
  final String? category;
  final String detailData;
  bool isBookmarked;
  String? idFromFirestore;

  NewsTile({
    Key? key,
    required this.author,
    required this.title,
    required this.img,
    required this.url,
    required this.publishedAt,
    this.category,
    required this.detailData,
    required this.isBookmarked,
    this.idFromFirestore,
  }) : super(key: key);

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    var homePageController = Get.put<HomePageController>(HomePageController());

    @override
    void iniState() {
      super.initState();

      homePageController.checkDataAlreadyExistInFirestroe(
          widget.author,
          widget.title,
          widget.img,
          widget.url,
          widget.publishedAt,
          widget.category,
          widget.detailData,
          widget.isBookmarked);
    }

    // PARSE TIME UTC TO LOCAL TIME
    var dateFormat =
        DateFormat("dd-MM-yyyy hh:mm aa"); // you can change the format here
    var utcDate = dateFormat.format(DateTime.parse(
      widget.publishedAt,
    )); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.DETAIL_NEWS_PAGE, arguments: widget.detailData);
      },
      child: Container(
        height: 175,
        width: Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.img != ''
                      ? NetworkImage(widget.img)
                      : NetworkImage("https://via.placeholder.com/150"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: DefaultText(
                      text: widget.title,
                      fontSize: 12,
                      textColor: cBlack,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 200,
                  child: DefaultText(
                      text: widget.author,
                      fontSize: 12,
                      textColor: cGrey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                DefaultText(
                  text: widget.category!,
                  fontSize: 12,
                  textColor: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
                // SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      text: createdDate,
                      fontSize: 12,
                      textColor: cGrey,
                      fontWeight: FontWeight.normal,
                    ),

                    // HANDLE BOOKMARK BUTTON

                    IconButton(
                        onPressed: () {
                          homePageController.checkDataAlreadyExistInFirestroe(
                              widget.author,
                              widget.title,
                              widget.img,
                              widget.url,
                              widget.publishedAt,
                              widget.category,
                              widget.detailData,
                              widget.isBookmarked);

                          setState(() {});
                        },
                        icon: Icon(
                          Icons.bookmark_add,
                          size: 20.0,
                        )),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
