import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/modules/widgets/appBar_title_with_logo.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/detail_news_page_controller.dart';

class DetailNewsPageView extends GetView<DetailNewsPageController> {
  @override
  Widget build(BuildContext context) {
    // mengambil alamat url dari ListTile
    var url = Get.arguments;
    // print(url);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleWithLogo(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: cBlack),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Opacity(
            opacity: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_outlined,
                color: cBlack,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: url,
          onWebViewCreated: ((WebViewController webViewController) {
            controller.completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
