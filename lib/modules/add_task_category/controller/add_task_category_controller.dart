import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskCategoryController extends GetxController {
  final selectedColorIndex = 0.obs;

  void selectedColor(int index) {
    selectedColorIndex.value = index;
  }

  List<Color> listCategoryColor = const [
    Color(0xFFC9CC41),
    Color(0xFF66CC41),
    Color(0xFF41CCA7),
    Color(0xFF4181CC),
    Color(0xFF41A2CC),
    Color(0xFFCC8441),
    Color(0xFF9741CC),
    Color(0xFFCC4173),
    Color(0xFFCCFF80),
    Color(0xFFFF9680),
    Color(0xFF80FFFF),
    Color(0xFF80FFD9),
    Color(0xFF809CFF),
    Color(0xFFFF80EB),
    Color(0xFFFC80FF),
    Color(0xFF80FFA3),
    Color(0xFF80D1FF),
    Color(0xFFFF8080),
  ];
}
