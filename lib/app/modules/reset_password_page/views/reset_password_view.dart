import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/controllers/firebase_auth_controller_controller.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authController = Get.find<FirebaseAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: cBlack),
            onPressed: () => Get.back(),
          ),
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
              SizedBox(height: 48),
              //
              // ==> send rsest password
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    DefaultText(
                      text: 'Enter your Email to be sent a reset password link',
                      fontSize: 16,
                      textColor: cBlack,
                      fontWeight: FontWeight.bold,
                    ),
                    //
                    SizedBox(height: 40),
                    //
                    TextFormField(
                      controller: controller.resetPasswordContr,
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
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: cGrey),
                        focusColor: cGrey,
                        fillColor: cBlack,
                        hoverColor: cBlack,
                      ),
                    ),
                    //
                    SizedBox(height: 32),
                    // ==> RESET BUTTON
                    ElevatedButton(
                      onPressed: () {
                        authController
                            .resetPassword(controller.resetPasswordContr.text);
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
                        text: 'RESET',
                        fontSize: 16,
                        textColor: cWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
