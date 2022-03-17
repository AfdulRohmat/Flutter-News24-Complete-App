// ignore_for_file: unnecessary_new

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/controllers/firebase_auth_controller_controller.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/reset_password_page/views/reset_password_view.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final authController = Get.find<FirebaseAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: cBlack),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==> LOGO NEWS24
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: Get.width,
              // color: Colors.amber,
              child: Center(
                child: Image.asset('assets/logos/title.png'),
              ),
            ),
            //
            // ==> Form Login
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  // => EMAIL
                  TextFormField(
                    controller: controller.emailContr,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: cBlack),
                    cursorColor: cBlack,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: cGrey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: cGrey),
                      ),
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, color: cGrey),
                      focusColor: cGrey,
                      fillColor: cBlack,
                      hoverColor: cBlack,
                    ),
                  ),
                  SizedBox(height: 32),
                  // => PASSWORD
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordContr,
                      keyboardType: TextInputType.text,
                      cursorColor: cBlack,
                      obscureText: !controller.passwordVisible.value,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: cGrey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: cGrey),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: cGrey),
                        focusColor: cGrey,
                        fillColor: cBlack,
                        hoverColor: cBlack,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.toglePasswordVisible();
                          },
                          icon: controller.passwordVisible.value
                              ? Icon(
                                  Icons.visibility,
                                  color: cBlack,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: cBlack,
                                ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            //
            SizedBox(height: 32),
            //
            // ==> SIGN UP BUTTON
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Email Verification',
                  titleStyle: TextStyle(
                    color: cBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  middleText:
                      'We have sent email notification to ${controller.emailContr.text}',
                  middleTextStyle: TextStyle(
                    color: cGrey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  backgroundColor: cWhite,
                  radius: 10,
                  actions: [
                    // // ==> NO LOGOUT
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(30, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: cWhite,
                        onPrimary: cBlack,
                        elevation: 0,
                      ),
                      child: DefaultText(
                        text: 'Ok',
                        fontSize: 14,
                        textColor: cBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
                authController.signUp(
                    controller.emailContr.text, controller.passwordContr.text);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: cBlack,
                onPrimary: cGrey,
                elevation: 0,
              ),
              child: DefaultText(
                text: 'SIGN UP',
                fontSize: 16,
                textColor: cWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
            //
            SizedBox(height: 32),
            //
            // ==> SIGIN IN WITH
            Center(
              child: DefaultText(
                text: 'or sign in with',
                fontSize: 12,
                textColor: cBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.SIGN_IN_PAGE);
                    },
                    child: Image.asset('assets/icons/signIn_gmail.png'),
                  ),
                  InkWell(
                    onTap: () {
                      authController.signInWithGoogle();
                    },
                    child: Image.asset('assets/icons/signIn_google.png'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/icons/signIn_fb.png'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/icons/signIn_twitter.png'),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 64),
            //
            // ==> DON'T HAVE AN ACCOUNT ? REGISTER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(
                    text: "Already have account ? ",
                    fontSize: 12,
                    textColor: cBlack,
                    fontWeight: FontWeight.normal),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SIGN_IN_PAGE);
                  },
                  child: DefaultText(
                      text: "Sign In",
                      fontSize: 12,
                      textColor: cBlack,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
