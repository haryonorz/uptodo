import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/dialog/controller/dialog_controller.dart';
import 'package:uptodo/shared/common/app_colors.dart';

class DialogTaskPriority extends StatelessWidget {
  final _controller = Get.put(DialogController());

  DialogTaskPriority({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      title: Center(
        child: Text(
          'Task Priority',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
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
          SizedBox(height: 22.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                10,
                (index) => GestureDetector(
                  onTap: () {
                    _controller.changeFlagIndex(index);
                  },
                  child: Obx(() {
                    return Container(
                      width: 64.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: index == _controller.selectedFlagIndex.value
                            ? AppColors.violetAreBlue
                            : AppColors.charlestonGreen,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/icons/label_flag.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Center(
                            child: Text('${index + 1}',
                                style: Theme.of(context).textTheme.titleMedium),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    Get.back();
                  },
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
