
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:get/get.dart';

class CategoryTabBar extends StatelessWidget {
  final String title;
  final Color bgColor, textColor;

  const CategoryTabBar({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: Get.width / 3.5,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: DefaultText(
          text: title,
          fontSize: 12,
          textColor: textColor,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
