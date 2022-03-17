import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/data/models/search_articles_model.dart';
import 'package:flutter_news_app/app/data/services/news_api.dart';
import 'package:flutter_news_app/app/data/services/search_news_api.dart';
import 'package:flutter_news_app/app/modules/home_page/widgets/news_tile.dart';
import 'package:flutter_news_app/app/modules/widgets/appbar_title_with_logo.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';

import 'package:get/get.dart';

import '../controllers/search_page_controller.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

class SearchPageView extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    var _currentFocus;

    void unfocus() {
      _currentFocus = FocusScope.of(context);

      if (!_currentFocus.hasPrimaryFocus) {
        _currentFocus.unfocus();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleWithLogo(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // ==> SEARCH BAR
          Container(
            margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
            height: 60,
            width: Get.width,
            decoration: BoxDecoration(
              color: cLightGrey,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Obx(
              () => TextFormField(
                controller: controller.searchContr,
                autocorrect: false,
                cursorColor: cBlack,
                onChanged: (value) {
                  controller.textSearch.value = value;

                  print(controller.textSearch);
                },
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: 'Looking for interesting news..',
                  prefixIcon: Icon(
                    Icons.search,
                    color: cGrey,
                  ),
                  suffixIcon: controller.textSearch.value != ''
                      ? GestureDetector(
                          child: Icon(
                            Icons.close_outlined,
                            color: cGrey,
                          ),
                          onTap: () {
                            controller.searchContr.clear();
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
          //
          // ==> HASIL SEARCH
          Expanded(
            child: Obx(
              () => (controller.textSearch.value == '')
                  ? Container(
                      child: Center(
                        child: DefaultText(
                          text: 'No data',
                          fontSize: 16,
                          textColor: cBlack,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  : FutureBuilder<List<SearchArticlesModel>>(
                      future: SearchNewsAPI.getNewsFromAPI(
                          controller.textSearch.value),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(cGrey),
                              ),
                            ),
                          );
                        } else {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              padding: EdgeInsets.only(
                                  bottom: 16, left: 16, right: 16),
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                var isBookmarkedFromData = [
                                  for (var i = 0;
                                      i < snapshot.data!.length;
                                      ++i)
                                    false
                                ];
                                print(isBookmarkedFromData);
                                return NewsTile(
                                  author: snapshot.data![index].author,
                                  title: snapshot.data![index].title,
                                  img: snapshot.data![index].img,
                                  url: snapshot.data![index].url,
                                  publishedAt:
                                      snapshot.data![index].publishedAt,
                                  category: 'Any',
                                  detailData: snapshot.data![index].url,
                                  isBookmarked: isBookmarkedFromData[index],
                                );
                              },
                              separatorBuilder: (_, index) =>
                                  SizedBox(height: 16),
                              itemCount: snapshot.data!.length,
                            );
                          }
                        }

                        return Container(
                          child: Center(
                            child: DefaultText(
                              text: 'Kesalahan saat mengambil data',
                              fontSize: 16,
                              textColor: cBlack,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
