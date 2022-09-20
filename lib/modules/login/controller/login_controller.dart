import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/routes.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  bool get formValidate => username.isNotEmpty && password.isNotEmpty;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void onInit() {
    usernameController.addListener(() {
      username.value = usernameController.text;
    });
    passwordController.addListener(() {
      password.value = passwordController.text;
    });
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  formSubmit() {
    Get.offAllNamed(AppRoutes.home);
  }
}
