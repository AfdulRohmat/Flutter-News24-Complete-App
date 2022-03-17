import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/controllers/firebase_auth_controller_controller.dart';
import 'app/modules/splashscreen_page/views/splashscreen_view.dart';
import 'app/routes/app_pages.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put<FirebaseAuthController>(
        FirebaseAuthController(),
        permanent: true);

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return StreamBuilder<User?>(
      stream: authController.streamAuthStatus,
      builder: (context, snapshotStream) {
        if (snapshotStream.connectionState == ConnectionState.active) {
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 1)),
            builder: (context, snapshotFuture) {
              if (snapshotFuture.connectionState == ConnectionState.waiting) {
                return SplashscreenView();
                //
              } else {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Application",
                  initialRoute: snapshotStream.data != null &&
                          snapshotStream.data!.emailVerified == true
                      ? Routes.BASE_FOR_BOTTOM_NAV
                      : Routes.SIGN_IN_PAGE,
                  getPages: AppPages.routes,
                );
              }
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
