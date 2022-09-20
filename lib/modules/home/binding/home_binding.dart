import 'package:get/get.dart';
import 'package:uptodo/modules/calendar/controller/calendar_controller.dart';
import 'package:uptodo/modules/focus/controller/focus_controller.dart';
import 'package:uptodo/modules/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CalendarController>(() => CalendarController());
    Get.lazyPut<FocusController>(() => FocusController());
  }
}
