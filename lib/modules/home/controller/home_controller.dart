import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedTabIndex = 0.obs;

  void changeTabIndex(int index) => selectedTabIndex.value = index;
}
