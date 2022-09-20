import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uptodo/modules/calendar/controller/calendar_controller.dart';
import 'package:uptodo/shared/widgets/item_task.dart';

class TaskToday extends GetView<CalendarController> {
  const TaskToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Obx(
        () {
          return controller.listDataToday.isNotEmpty
              ? Column(
                  children: List.generate(
                    controller.listDataToday.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        bottom:
                            index == controller.listDataToday.length ? 16.h : 0,
                      ),
                      child: ItemTask(
                        task: controller.listDataToday[index],
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: Text('No Data'),
                );
        },
      ),
    );
  }
}
