import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/calendar/controller/calendar_controller.dart';
import 'package:uptodo/modules/calendar/view/calendar.dart';
import 'package:uptodo/modules/calendar/view/task_complete.dart';
import 'package:uptodo/modules/calendar/view/task_today.dart';
import 'package:uptodo/shared/common/app_colors.dart';
import 'package:uptodo/shared/common/common.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.jet,
              child: const Calendar(),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.quartz,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          color: AppColors.violetAreBlue,
                          borderRadius: BorderRadius.circular(4),
                          shape: BoxShape.rectangle,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        labelPadding: EdgeInsets.zero,
                        controller: controller.tabController,
                        tabs: [
                          Obx(() {
                            return Container(
                              width: 140.w,
                              height: 49.h,
                              decoration: controller.selectedTabIndex.value == 0
                                  ? null
                                  : BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: AppColors.spanishGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                              child: const Center(
                                child: Text(
                                  'Today',
                                ),
                              ),
                            );
                          }),
                          Obx(() {
                            return Container(
                              width: 140.w,
                              height: 49.h,
                              decoration: controller.selectedTabIndex.value == 1
                                  ? null
                                  : BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: AppColors.spanishGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                              child: const Center(
                                child: Text(
                                  'Completed',
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: controller.tabController,
                        children: const [
                          TaskToday(),
                          TaskComplete(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
