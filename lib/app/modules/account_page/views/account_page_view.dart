import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/firebase_auth_controller_controller.dart';
import '../../../data/constants/constan_color.dart';
import '../../widgets/default_text.dart';
import '../controllers/account_page_controller.dart';
import '../widget/account_display_info.dart';

class AccountPageView extends GetView<AccountPageController> {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<FirebaseAuthController>();

    return Scaffold(
        appBar: AppBar(
          title: DefaultText(
            text: 'Account',
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
                Center(
                  child: DefaultText(
                    text: 'Account Information',
                    fontSize: 16,
                    textColor: cBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                StreamBuilder<User?>(
                  stream: authController.getAccountInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display Name
                          DisplayInfo(
                            title: 'Name',
                            value: snapshot.data!.displayName == ''
                                ? 'No Name'
                                : snapshot.data!.displayName.toString(),
                          ),
                          SizedBox(height: 16),
                          DisplayInfo(
                            title: 'Email',
                            value: snapshot.data!.email == ''
                                ? 'No Email'
                                : snapshot.data!.email.toString(),
                          ),
                          SizedBox(height: 16),
                          // CHANGE PASSWORD BUTTON
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.RESET_PASSWORD);
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(180, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: cBlack,
                              onPrimary: cGrey,
                              elevation: 0,
                            ),
                            child: DefaultText(
                              text: 'Change Password',
                              fontSize: 14,
                              textColor: cWhite,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      );
                    } else {}

                    return Container();
                  },
                ),
                SizedBox(height: 64),
              ],
            ),
          ),
        ));
  }
}
