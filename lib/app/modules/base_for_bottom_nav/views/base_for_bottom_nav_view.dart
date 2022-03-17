import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/modules/base_for_bottom_nav/views/bottom_navigation_news_app.dart';
import 'package:flutter_news_app/app/modules/bookmark_page/views/bookmark_page_view.dart';
import 'package:flutter_news_app/app/modules/home_page/views/home_page_view.dart';
import 'package:flutter_news_app/app/modules/search_page/views/search_page_view.dart';
import 'package:flutter_news_app/app/modules/setting_page/views/setting_page_view.dart';

import 'package:get/get.dart';

import '../controllers/base_for_bottom_nav_controller.dart';

class BaseForBottomNavView extends GetView<BaseForBottomNavController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseForBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomePageView(),
              SearchPageView(),
              BookmarkPageView(),
              SettingPageView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationNewsApp(),
        );
      },
    );
  }
}
