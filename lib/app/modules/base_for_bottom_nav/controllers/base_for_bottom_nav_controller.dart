import 'package:get/get.dart';

class BaseForBottomNavController extends GetxController {
   /// ==> handle bottom navigation
  var tabIndex = 0.obs;

  void setTabIndex(valueParam) {
    tabIndex.value = valueParam;
    update();
  }
}
