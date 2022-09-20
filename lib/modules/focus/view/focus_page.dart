import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:uptodo/models/running_app.dart';
import 'package:uptodo/modules/focus/controller/focus_controller.dart';
import 'package:uptodo/modules/focus/view/chart_app_overview.dart';
import 'package:uptodo/modules/focus/view/item_running_app.dart';
import 'package:uptodo/shared/common/common.dart';

class FocusPage extends GetView<FocusController> {
  const FocusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Mode'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Obx(() {
                return Center(
                  child: CircularPercentIndicator(
                    radius: 100,
                    animation: true,
                    lineWidth: 10,
                    percent:
                        controller.duration.value.inMinutes.remainder(60) / 60,
                    center: Text(
                      "${controller.twoDigits(
                        controller.duration.value.inMinutes.remainder(60),
                      )}:${controller.twoDigits(
                        controller.duration.value.inSeconds.remainder(60),
                      )}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: AppColors.davysGrey,
                    progressColor: AppColors.vistaBlue,
                  ),
                );
              }),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    'While your focus mode is on, all of your\nnotifications will be off',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: Obx(() {
                  return ElevatedButton(
                    onPressed: () {
                      if (controller.isRunning.value) {
                        controller.stopTimer();
                      } else {
                        controller.startTimer();
                      }
                    },
                    child: Text(
                      '${controller.isRunning.value ? 'Stop' : 'Start'} Focusing',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                }),
              ),
              SizedBox(height: 55.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      backgroundColor: AppColors.white21,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'This Week',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset(
                          'assets/icons/ic_arrow_down.svg',
                          width: 16.w,
                          height: 16.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              const ChartAppOverview(),
              SizedBox(height: 24.h),
              Text(
                'Applications',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 16.h),
              Column(
                children: List.generate(
                  listRunningApp.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: ItemRunningApp(
                      runningApp: listRunningApp[index],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
