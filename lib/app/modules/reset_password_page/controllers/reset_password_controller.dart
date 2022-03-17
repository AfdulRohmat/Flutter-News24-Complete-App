import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController resetPasswordContr = TextEditingController();

  @override
  void onInit() {
    resetPasswordContr;
   
    super.onInit();
  }


  @override
  void dispose() {
    resetPasswordContr.dispose();
  
    super.dispose();
  }
}
