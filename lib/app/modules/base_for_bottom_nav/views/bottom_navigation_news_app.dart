import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/base_for_bottom_nav/controllers/base_for_bottom_nav_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavigationNewsApp extends StatelessWidget {
  const BottomNavigationNewsApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<BaseForBottomNavController>();

    return Obx(() => Container(
          height: 60,
          // color: Colors.amber,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: controller.tabIndex.value,
            elevation: 10,
            selectedItemColor: cBlack,
            unselectedItemColor: cGrey,
            onTap: (value) {
              controller.setTabIndex(value);
            },
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              // Home
              _bottomNavigationBarItem(
                'Home',
                'home_unselected.png',
                'home_selected.png',
              ),

              // Search
              _bottomNavigationBarItem(
                'Search',
                'search_unselected.png',
                'search_selected.png',
              ),

              // Bookmark
              _bottomNavigationBarItem(
                'Bookmark',
                'bookmark_unselected.png',
                'bookmark_selected.png',
              ),

              // Setting
              _bottomNavigationBarItem(
                'Setting',
                'settings_unselected.png',
                'settings_selected.png',
              ),
            ],
          ),
        ));
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String label, String iconOutlined, String iconColored) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        padding: EdgeInsets.only(bottom: 4),
        child: Image.asset(
          'assets/icons/bottomNav/$iconOutlined',
        ),
      ),
      activeIcon: Container(
        padding: EdgeInsets.only(bottom: 4),
        child: Image.asset(
          'assets/icons/bottomNav/$iconColored',
        ),
      ),
    );
  }
}
