import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/data/models/settings_model.dart';
import 'package:flutter_news_app/app/modules/setting_page/widgets/settings_list_tile.dart';
import 'package:flutter_news_app/app/modules/widgets/appbar_title_with_logo.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';

import 'package:get/get.dart';

import '../controllers/setting_page_controller.dart';

class SettingPageView extends GetView<SettingPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleWithLogo(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              // ==> SETTINGS
              DefaultText(
                text: 'Settings',
                fontSize: 16,
                textColor: cBlack,
                fontWeight: FontWeight.bold,
              ),
              //
              SizedBox(height: 28),
              //
              // ==> SETTINGS LIST TILE SETTING
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: settings.length,
                  itemBuilder: (context, index) {
                    // final sortedSettingsById = settings..sort( (a,b) => a.);
                    return SettingsListTile(
                      icon: settings[index].icon,
                      title: settings[index].title,
                      dataToPage: settings[index].title,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
