import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailContr = TextEditingController();
  TextEditingController passwordContr = TextEditingController();

  var passwordVisible = false.obs;

  void toglePasswordVisible() {
    passwordVisible.toggle();
    update();
  }

  @override
  void onInit() {
    emailContr;
    passwordContr;
    passwordVisible;
    super.onInit();
  }

  @override
  void dispose() {
    emailContr.dispose();
    passwordContr.dispose();
    super.dispose();
  }
}
