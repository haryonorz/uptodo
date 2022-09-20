import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:uptodo/shared/common/common.dart';

class DialogTime extends StatelessWidget {
  const DialogTime({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Choose Time',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      titlePadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 10.h,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      backgroundColor: AppColors.jet,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            thickness: 1,
            height: 1,
            color: AppColors.spanishGrey,
          ),
          SizedBox(height: 21.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            width: 300.w,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 64.w,
                        decoration: BoxDecoration(
                          color: AppColors.charlestonGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        width: 64.w,
                        decoration: BoxDecoration(
                          color: AppColors.charlestonGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        width: 64.w,
                        decoration: BoxDecoration(
                          color: AppColors.charlestonGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                TimePickerSpinner(
                  is24HourMode: false,
                  alignment: Alignment.center,
                  normalTextStyle: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.white10),
                  highlightedTextStyle:
                      Theme.of(context).textTheme.headlineSmall,
                  spacing: 36.w,
                  itemHeight: 24.h,
                  isForce2Digits: true,
                  onTimeChange: (time) {},
                ),
              ],
            ),
          ),
          SizedBox(height: 21.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Save',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
