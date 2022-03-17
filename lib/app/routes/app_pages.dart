import 'package:get/get.dart';

import 'package:flutter_news_app/app/modules/about_page/bindings/about_page_binding.dart';
import 'package:flutter_news_app/app/modules/about_page/views/about_page_view.dart';
import 'package:flutter_news_app/app/modules/account_page/bindings/account_page_binding.dart';
import 'package:flutter_news_app/app/modules/account_page/views/account_page_view.dart';
import 'package:flutter_news_app/app/modules/base_for_bottom_nav/bindings/base_for_bottom_nav_binding.dart';
import 'package:flutter_news_app/app/modules/base_for_bottom_nav/views/base_for_bottom_nav_view.dart';
import 'package:flutter_news_app/app/modules/bookmark_page/bindings/bookmark_page_binding.dart';
import 'package:flutter_news_app/app/modules/bookmark_page/views/bookmark_page_view.dart';
import 'package:flutter_news_app/app/modules/detail_news_page/bindings/detail_news_page_binding.dart';
import 'package:flutter_news_app/app/modules/detail_news_page/views/detail_news_page_view.dart';
import 'package:flutter_news_app/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:flutter_news_app/app/modules/home_page/views/home_page_view.dart';
import 'package:flutter_news_app/app/modules/reset_password_page/bindings/reset_password_binding.dart';
import 'package:flutter_news_app/app/modules/reset_password_page/views/reset_password_view.dart';
import 'package:flutter_news_app/app/modules/search_page/bindings/search_page_binding.dart';
import 'package:flutter_news_app/app/modules/search_page/views/search_page_view.dart';
import 'package:flutter_news_app/app/modules/setting_page/bindings/setting_page_binding.dart';
import 'package:flutter_news_app/app/modules/setting_page/views/setting_page_view.dart';
import 'package:flutter_news_app/app/modules/sign_in_page/bindings/sign_in_page_binding.dart';
import 'package:flutter_news_app/app/modules/sign_in_page/views/sign_in_page_view.dart';
import 'package:flutter_news_app/app/modules/sign_up_page/bindings/sign_up_binding.dart';
import 'package:flutter_news_app/app/modules/sign_up_page/views/sign_up_view.dart';
import 'package:flutter_news_app/app/modules/splashscreen_page/bindings/splashscreen_binding.dart';
import 'package:flutter_news_app/app/modules/splashscreen_page/views/splashscreen_view.dart';
import 'package:flutter_news_app/app/modules/term_condition_page/bindings/term_condition_page_binding.dart';
import 'package:flutter_news_app/app/modules/term_condition_page/views/term_condition_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BASE_FOR_BOTTOM_NAV;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.TERM_CONDITION_PAGE,
      page: () => TermConditionPageView(),
      binding: TermConditionPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_NEWS_PAGE,
      page: () => DetailNewsPageView(),
      binding: DetailNewsPageBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARK_PAGE,
      page: () => BookmarkPageView(),
      binding: BookmarkPageBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_PAGE,
      page: () => SettingPageView(),
      binding: SettingPageBinding(),
    ),
    GetPage(
      name: _Paths.BASE_FOR_BOTTOM_NAV,
      page: () => BaseForBottomNavView(),
      binding: BaseForBottomNavBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_PAGE,
      page: () => SignInPageView(),
      binding: SignInPageBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_PAGE,
      page: () => AboutPageView(),
      binding: AboutPageBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_PAGE,
      page: () => AccountPageView(),
      binding: AccountPageBinding(),
    ),
  ];
}
