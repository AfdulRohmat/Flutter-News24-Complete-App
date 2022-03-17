import 'package:get/get.dart';

import '../controllers/detail_news_page_controller.dart';

class DetailNewsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNewsPageController>(
      () => DetailNewsPageController(),
    );
  }
}
