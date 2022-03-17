import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/controllers/firebase_auth_controller_controller.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/sign_in_page_controller.dart';

class SignInPageView extends GetView<SignInPageController> {
  final authController = Get.find<FirebaseAuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.RESET_PASSWORD);
                        },
                        child: DefaultText(
                          text: 'Forgot Password ?',
                          fontSize: 12,
                          textColor: cBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            //
            SizedBox(height: 32),
            //
            // ==> LOGIN BUTTON
            ElevatedButton(
              onPressed: () {
                controller.emailContr.text.isEmpty &&
                        controller.passwordContr.text.isEmpty
                    ? showDialog(
                        context: context,
                        builder: (ctxt) => AlertDialog(
                          title: DefaultText(
                            text: "Email and Password is Required.",
                            fontSize: 14,
                            textColor: cBlack,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    : authController.signIn(controller.emailContr.text,
                        controller.passwordContr.text);
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
                text: 'SIGN IN',
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
                      authController.signInWithGoogle();
                    },
                    child: Image.asset('assets/icons/signIn_google.png'),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctxt) => AlertDialog(
                          title: DefaultText(
                            text: "Not Available",
                            fontSize: 14,
                            textColor: cBlack,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assets/icons/signIn_fb.png'),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctxt) => AlertDialog(
                          title: DefaultText(
                            text: "Not Available",
                            fontSize: 14,
                            textColor: cBlack,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assets/icons/signIn_twitter.png'),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 40),
            //
            // ==> DON'T HAVE AN ACCOUNT ? REGISTER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(
                    text: "Don't have an account ? ",
                    fontSize: 12,
                    textColor: cBlack,
                    fontWeight: FontWeight.normal),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SIGN_UP);
                  },
                  child: DefaultText(
                      text: "Register",
                      fontSize: 12,
                      textColor: cBlack,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            //
            SizedBox(height: 24),
            //
            // ==> TERM AND CONDITIONS
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By signing up to News24 you are accepting our\n',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: cBlack,
                  ),
                ),
                children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed(Routes.TERM_CONDITION_PAGE),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: cBlack,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
