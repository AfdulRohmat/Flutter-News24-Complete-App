import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  const DefaultText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.length > 95 ? text.substring(0, 80) + ' (lanjut baca...)' : text,
      overflow: TextOverflow.ellipsis,
      maxLines: 6,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
