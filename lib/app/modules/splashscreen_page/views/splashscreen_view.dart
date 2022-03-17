import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            // width: Get.width * 0.5,
            // height: Get.height * 0.5,
            // color: Colors.amber,
            child: Image.asset('assets/logos/title.png'),
          ),
        ),
      ),
    );
  }
}
