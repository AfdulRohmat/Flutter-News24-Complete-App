import 'package:get/get.dart';

import '../controllers/bookmark_page_controller.dart';

class BookmarkPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarkPageController>(
      () => BookmarkPageController(),
    );
  }
}
