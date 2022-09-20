import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uptodo/modules/calendar/controller/calendar_controller.dart';
import 'package:uptodo/shared/widgets/item_task.dart';

class TaskComplete extends GetView<CalendarController> {
  const TaskComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Obx(
        () {
          return controller.listDataCompelete.isNotEmpty
              ? Column(
                  children: List.generate(
                    controller.listDataCompelete.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        bottom: index == controller.listDataCompelete.length
                            ? 16.h
                            : 0,
                      ),
                      child: ItemTask(
                        task: controller.listDataCompelete[index],
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
