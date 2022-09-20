import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/models/task.dart';
import 'package:uptodo/modules/calendar/controller/calendar_controller.dart';
import 'package:uptodo/modules/dialog/view/dialog_calendar.dart';
import 'package:uptodo/modules/dialog/view/dialog_category.dart';
import 'package:uptodo/modules/dialog/view/dialog_task_priority.dart';
import 'package:uptodo/modules/task/controller/task_controller.dart';
import 'package:uptodo/shared/common/common.dart';
import 'package:uptodo/shared/widgets/custom_alert_dialog.dart';

class TaskPage extends GetView<TaskController> {
  final _controller = Get.put(CalendarController());

  final Task task;

  TaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: SvgPicture.asset('assets/icons/ic_close.svg'),
          ),
        ),
        leadingWidth: 56.w,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 24.w),
            child: SvgPicture.asset(
              'assets/icons/ic_repeat.svg',
              width: 32.w,
              height: 32.h,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset('assets/icons/ic_task.svg'),
                    minLeadingWidth: 24.w,
                    title: Text(task.title),
                    subtitle: Text(
                      task.description,
                      style: const TextStyle(color: AppColors.spanishGrey),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.dialog(
                          CustomAlertDialog(
                            titleText: 'Edit Task title',
                            yesText: 'Edit',
                            body: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Title',
                                    hintStyle:
                                        TextStyle(color: AppColors.spanishGrey),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: .8,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: .8,
                                        color: AppColors.spanishGrey,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Description',
                                    hintStyle:
                                        TextStyle(color: AppColors.spanishGrey),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: .8,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: .8,
                                        color: AppColors.spanishGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset('assets/icons/ic_pencil.svg'),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset('assets/icons/ic_timer.svg'),
                    minLeadingWidth: 24.w,
                    title: const Text('Task Time :'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Get.dialog(
                          DialogCalendar(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.quartz,
                        minimumSize: Size(42.w, 29.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                      ),
                      child: const Text('Today at 16:66'),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset('assets/icons/ic_tag.svg'),
                    minLeadingWidth: 24.w,
                    title: const Text('Task Category :'),
                    trailing: ElevatedButton.icon(
                      onPressed: () {
                        Get.dialog(
                          DialogCategory(),
                        );
                      },
                      icon: SvgPicture.asset(
                        task.taskCategory.iconPath,
                        width: 14.w,
                        height: 14.h,
                        color: task.taskCategory.color,
                      ),
                      label: Text(task.taskCategory.name),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.quartz,
                        minimumSize: Size(42.w, 29.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset('assets/icons/ic_flag.svg'),
                    minLeadingWidth: 24.w,
                    title: const Text('Task Priority :'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Get.dialog(
                          DialogTaskPriority(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.quartz,
                        minimumSize: Size(42.w, 29.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                      ),
                      child: const Text('Default'),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset('assets/icons/ic_hierarchy.svg'),
                    minLeadingWidth: 24.w,
                    title: const Text('Sub - Task :'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.quartz,
                        minimumSize: Size(42.w, 29.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                      ),
                      child: const Text('Add Sub- Task'),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.dialog(
                        CustomAlertDialog(
                          titleText: 'Delete Task',
                          yesText: 'Delete',
                          onYesPressed: () {
                            if (task.isCompleted) {
                              _controller.listDataCompelete.removeWhere(
                                  (element) => element.id == task.id);
                            } else {
                              _controller.listDataToday.removeWhere(
                                  (element) => element.id == task.id);
                            }
                            Get.back();
                            Get.back();
                          },
                          body: const Center(
                            child: Text(
                              'Are You sure you want to delete this task?\nTask title : Do math homework',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset('assets/icons/ic_trash.svg'),
                    minLeadingWidth: 24.w,
                    title: const Text(
                      'Delete Task',
                      style: TextStyle(
                        color: AppColors.tartOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: ElevatedButton(
                child: const Text('Edit Task'),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
