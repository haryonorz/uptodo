import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/routes.dart';

class RegisterController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  bool get formValidate =>
      username.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    usernameController.addListener(() {
      username.value = usernameController.text;
    });
    passwordController.addListener(() {
      password.value = passwordController.text;
    });
    confirmPasswordController.addListener(() {
      confirmPassword.value = confirmPasswordController.text;
    });
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  formSubmit() {
    Get.offAllNamed(AppRoutes.home);
  }
}
