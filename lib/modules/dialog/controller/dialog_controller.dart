import 'package:get/get.dart';

class DialogController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var selectedCategoryIndex = 0.obs;
  var selectedFlagIndex = 0.obs;

  void changeCategoryIndex(int index) => selectedCategoryIndex.value = index;
  void changeFlagIndex(int index) => selectedFlagIndex.value = index;
}
