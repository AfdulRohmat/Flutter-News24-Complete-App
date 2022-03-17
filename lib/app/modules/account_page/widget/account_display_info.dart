
import 'package:flutter/material.dart';

import '../../../data/constants/constan_color.dart';
import '../../widgets/default_text.dart';

class DisplayInfo extends StatelessWidget {
  final String title;
  final String value;

  const DisplayInfo({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DefaultText(
          text: '$title : ',
          fontSize: 14,
          textColor: cBlack,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(width: 4),
        DefaultText(
          text: value,
          fontSize: 14,
          textColor: cBlack,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}