import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uptodo/models/task.dart';

class CalendarController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  late VoidCallback onChanged;
  var selectedTabIndex = 0.obs;

  var selectedDay = DateTime.now().obs;
  var listDataToday = <Task>[].obs;
  var listDataCompelete = <Task>[].obs;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    onChanged = () => selectedTabIndex.value = tabController.index;
    tabController.addListener(onChanged);
    getTaskToday();
    getTaskComplete();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.removeListener(onChanged);
    tabController.dispose();
    super.onClose();
  }

  List<Task> getTask(DateTime day) {
    return listTasks
        .where(
          (element) =>
              (DateFormat('yyyy-MM-dd').format(day) ==
                  DateFormat('yyyy-MM-dd').format(element.dateTime)) &&
              !element.isCompleted,
        )
        .toList();
  }

  void getListTask() {
    listDataToday.value = listTasks
        .where(
          (element) => !element.isCompleted,
        )
        .toList();
    listDataCompelete.value =
        listTasks.where((element) => element.isCompleted).toList();
  }

  void getTaskToday() {
    listDataToday.value = listTasks
        .where(
          (element) =>
              (DateFormat('yyyy-MM-dd').format(selectedDay.value) ==
                  DateFormat('yyyy-MM-dd').format(element.dateTime)) &&
              !element.isCompleted,
        )
        .toList();
  }

  void getTaskComplete() {
    listDataCompelete.value = listTasks
        .where((element) =>
            (DateFormat('yyyy-MM-dd').format(selectedDay.value) ==
                DateFormat('yyyy-MM-dd').format(element.dateTime)) &&
            element.isCompleted)
        .toList();
  }
}
