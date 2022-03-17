import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNewsPageController extends GetxController {
  final Completer<WebViewController> completer = Completer<WebViewController>();

  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.onInit();
  }
}
