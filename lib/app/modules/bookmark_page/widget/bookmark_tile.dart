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

class BookmarkTile extends StatefulWidget {
  final String id;
  final String author;
  final String title;
  final String img;
  final String url;
  final String publishedAt;
  final String? category;
  final String detailData;
  bool isBookmarked;

  BookmarkTile({
    Key? key,
    required this.id,
    required this.author,
    required this.title,
    required this.img,
    required this.url,
    required this.publishedAt,
    this.category,
    required this.detailData,
    required this.isBookmarked,
  }) : super(key: key);

  @override
  State<BookmarkTile> createState() => _BookmarkTileState();
}

class _BookmarkTileState extends State<BookmarkTile> {
  @override
  Widget build(BuildContext context) {
    var bookmarkPageController =
        Get.put<BookmarkPageController>(BookmarkPageController());

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
                  image: NetworkImage(widget.img),
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
                    IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Remove Article',
                          titleStyle: TextStyle(
                            color: cBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          titlePadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          middleText:
                              'Are you sure remove article from bookmark ?',
                          middleTextStyle: TextStyle(
                            color: cGrey,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                          backgroundColor: cWhite,
                          radius: 10,
                          actions: [
                            // ==> NO REMOVE ARTICLE
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
                                textColor: cBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 16),
                            //
                            // // ==> YES REMOVE FROM BOOKMARK
                            ElevatedButton(
                              onPressed: () {
                                bookmarkPageController
                                    .deleteDataFromFirestore(widget.id);
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
                                textColor: cGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        );
                      },
                      icon: widget.isBookmarked == true
                          ? Icon(
                              Icons.bookmark_added,
                              size: 20.0,
                            )
                          : Icon(
                              Icons.bookmark_add_outlined,
                              size: 20.0,
                            ),
                    ),
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
