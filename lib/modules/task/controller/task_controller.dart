import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var title = ''.obs;
  var description = ''.obs;
  bool get formValidate => title.isNotEmpty && description.isNotEmpty;

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void onInit() {
    titleController.addListener(() {
      title.value = titleController.text;
    });
    descriptionController.addListener(() {
      description.value = descriptionController.text;
    });
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
