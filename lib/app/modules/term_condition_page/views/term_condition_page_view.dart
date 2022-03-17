import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/term_condition_page_controller.dart';

class TermConditionPageView extends GetView<TermConditionPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: DefaultText(
            text: 'Term & Condition',
            fontSize: 16,
            textColor: cBlack,
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: cBlack),
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                DefaultText(
                  text: 'Paragraph 1',
                  fontSize: 16,
                  textColor: cBlack,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue interdum urna, et porttitor velit. Sed bibendum ante diam, ac rutrum dolor mattis eget. Aliquam erat volutpat. Quisque eget justo a odio mattis ullamcorper. In accumsan non libero facilisis tristique. Aliquam id ipsum gravida, commodo urna sed, porta felis. Vestibulum cursus tempor lectus nec suscipit. Proin ligula orci, porta at ipsum in, viverra interdum sapien. Donec pellentesque in purus nec tristique.',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: cBlack,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                DefaultText(
                  text: 'Paragraph 2',
                  fontSize: 16,
                  textColor: cBlack,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue interdum urna, et porttitor velit. Sed bibendum ante diam, ac rutrum dolor mattis eget. Aliquam erat volutpat. Quisque eget justo a odio mattis ullamcorper. In accumsan non libero facilisis tristique. Aliquam id ipsum gravida, commodo urna sed, porta felis. Vestibulum cursus tempor lectus nec suscipit. Proin ligula orci, porta at ipsum in, viverra interdum sapien. Donec pellentesque in purus nec tristique.',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: cBlack,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 64),
              ],
            ),
          ),
        ));
  }
}
