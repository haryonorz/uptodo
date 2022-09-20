import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/dialog/view/dialog_calendar.dart';
import 'package:uptodo/modules/dialog/view/dialog_category.dart';
import 'package:uptodo/modules/dialog/view/dialog_task_priority.dart';
import 'package:uptodo/shared/common/app_colors.dart';
import 'package:uptodo/shared/common/common.dart';

class AddTaskButtomSheet extends StatelessWidget {
  const AddTaskButtomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Task',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 14.h),
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.transparent,
              hintText: 'Title',
              hintStyle: TextStyle(color: AppColors.silverFoil),
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
              hintStyle: TextStyle(color: AppColors.silverFoil),
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
          SizedBox(height: 20.h),
          Row(
            children: [
              GestureDetector(
                child: SvgPicture.asset('assets/icons/ic_timer.svg'),
                onTap: () {
                  Get.dialog(
                    DialogCalendar(),
                  );
                },
              ),
              SizedBox(width: 32.w),
              GestureDetector(
                child: SvgPicture.asset('assets/icons/ic_tag.svg'),
                onTap: () {
                  Get.dialog(
                    DialogCategory(),
                  );
                },
              ),
              SizedBox(width: 32.w),
              GestureDetector(
                child: SvgPicture.asset('assets/icons/ic_flag.svg'),
                onTap: () {
                  Get.dialog(
                    DialogTaskPriority(),
                  );
                },
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/ic_send.svg'),
            ],
          )
        ],
      ),
    );
  }
}
