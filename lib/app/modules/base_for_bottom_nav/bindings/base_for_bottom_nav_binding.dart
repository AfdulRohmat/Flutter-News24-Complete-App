import 'package:flutter_news_app/app/modules/bookmark_page/controllers/bookmark_page_controller.dart';
import 'package:flutter_news_app/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:flutter_news_app/app/modules/search_page/controllers/search_page_controller.dart';
import 'package:flutter_news_app/app/modules/setting_page/controllers/setting_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/base_for_bottom_nav_controller.dart';

class BaseForBottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseForBottomNavController>(() => BaseForBottomNavController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<SearchPageController>(() => SearchPageController());
    Get.lazyPut<BookmarkPageController>(() => BookmarkPageController());
    Get.lazyPut<SettingPageController>(() => SettingPageController());
  }
}
