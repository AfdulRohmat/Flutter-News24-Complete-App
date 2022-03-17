import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/controllers/firebase_auth_controller_controller.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SettingsListTile extends StatelessWidget {
  final String icon;
  final String title;
  final String dataToPage;

  const SettingsListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.dataToPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<FirebaseAuthController>();

    return ListTile(
      onTap: () {
        if (dataToPage == 'Term & Conditions') {
          Get.toNamed(Routes.TERM_CONDITION_PAGE);
          //
        } else if (dataToPage == 'Log Out') {
          Get.defaultDialog(
            title: 'Logout',
            titleStyle: TextStyle(
              color: cBlack,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            middleText: 'Are you sure you want to Logout ?',
            middleTextStyle: TextStyle(
              color: cGrey,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            backgroundColor: cWhite,
            radius: 10,
            actions: [
              // ==> YES LOGOUT
              ElevatedButton(
                onPressed: () {
                  authController.logOut();
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
                  text: 'Yes',
                  fontSize: 14,
                  textColor: cGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 16),
              //
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
                  text: 'No',
                  fontSize: 14,
                  textColor: cBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
          //
        } else if (dataToPage == 'Account') {
          Get.toNamed(Routes.ACCOUNT_PAGE);
          //
        } else if (dataToPage == 'About') {
          Get.toNamed(Routes.ABOUT_PAGE);

          //
        }
      },
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/settingIcons/$icon'),
        ],
      ),
      title: DefaultText(
        text: title,
        fontSize: 12,
        textColor: cBlack,
        fontWeight: FontWeight.bold,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
