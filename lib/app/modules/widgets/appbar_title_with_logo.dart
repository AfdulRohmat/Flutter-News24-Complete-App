// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarTitleWithLogo extends StatelessWidget {
  const AppBarTitleWithLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/logo_svg.svg',
          semanticsLabel: 'news24 logo',
          color: cBlack,
        ),
        SizedBox(width: 8),
        DefaultText(
            text: 'News24',
            fontSize: 16,
            textColor: cBlack,
            fontWeight: FontWeight.bold)
      ],
    );
  }
}
