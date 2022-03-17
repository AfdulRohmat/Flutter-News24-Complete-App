import 'package:get/get.dart';

import '../controllers/term_condition_page_controller.dart';

class TermConditionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermConditionPageController>(
      () => TermConditionPageController(),
    );
  }
}
