import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/modules/widgets/appBar_title_with_logo.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';

import 'package:get/get.dart';

import '../../../data/constants/constan_color.dart';
import '../controllers/bookmark_page_controller.dart';
import '../widget/bookmark_tile.dart';

class BookmarkPageView extends GetView<BookmarkPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitleWithLogo(),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    text: 'Bookmark',
                    fontSize: 16,
                    textColor: cBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Delete All Article',
                          titleStyle: TextStyle(
                            color: cBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          titlePadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          middleText:
                              'Are you sure delete all article from bookmark ?',
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
                                controller.deleteALLDataFromFirestore();
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
                      icon: Icon(Icons.delete_rounded))
                ],
              ),
            ),
            //
            SizedBox(height: 24),
            //
            Expanded(
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: controller.getDataRealtime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.data == null) {
                      Center(
                        child: DefaultText(
                          text: 'Tidak ada article yang di Bookmark',
                          fontSize: 16,
                          textColor: cBlack,
                          fontWeight: FontWeight.normal,
                        ),
                      );
                    } else {
                      var article = snapshot.data?.docs;
                      return ListView.separated(
                        padding:
                            EdgeInsets.only(bottom: 16, left: 16, right: 16),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BookmarkTile(
                            id: (article![index].id),
                            author: (article[index].data()
                                as Map<String, dynamic>)['author'],
                            title: (article[index].data()
                                as Map<String, dynamic>)['title'],
                            img: (article[index].data()
                                as Map<String, dynamic>)['img'],
                            url: (article[index].data()
                                as Map<String, dynamic>)['url'],
                            publishedAt: (article[index].data()
                                as Map<String, dynamic>)['publishedAt'],
                            category: (article[index].data()
                                as Map<String, dynamic>)['category'],
                            detailData: (article[index].data()
                                as Map<String, dynamic>)['detailData'],
                            isBookmarked: (article[index].data()
                                as Map<String, dynamic>)['isBookmarked'],
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: article!.length,
                      );
                    }
                  }
                  return Center(
                    child: DefaultText(
                      text: 'Tidak ada article yang di Bookmark',
                      fontSize: 16,
                      textColor: cBlack,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
