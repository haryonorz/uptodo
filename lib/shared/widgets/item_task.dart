import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uptodo/models/task.dart';
import 'package:uptodo/routes/routes.dart';
import 'package:uptodo/shared/common/common.dart';

class ItemTask extends StatelessWidget {
  final Task task;
  const ItemTask({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.task,
        arguments: task,
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 12.h,
          right: 10.h,
          bottom: task.isCompleted ? 12.h : 0,
        ),
        decoration: BoxDecoration(
          color: AppColors.quartz,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          crossAxisAlignment: task.isCompleted
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: 0,
              groupValue: int,
              onChanged: (value) {},
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: AppColors.white87,
                        ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: Text(
                            '${(DateFormat('yyyy-MM-dd').format(task.dateTime) == DateFormat('yyyy-MM-dd').format(DateTime.now())) ? "Today" : DateFormat.yMMMd().format(task.dateTime)} At ${task.dateTime.hour}:${task.dateTime.minute}',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: AppColors.spanishGrey,
                                    ),
                          ),
                        ),
                      ),
                      task.isCompleted
                          ? Container()
                          : Row(
                              children: [
                                SizedBox(width: 6.w),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    task.taskCategory.iconPath,
                                    width: 14.w,
                                    height: 14.h,
                                    color: AppColors.charlestonGreen
                                        .withOpacity(.7),
                                  ),
                                  label: Text(task.taskCategory.name),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: task.taskCategory.color,
                                    minimumSize: Size(42.w, 29.h),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/label_flag.svg',
                                    width: 14.w,
                                    height: 14.h,
                                  ),
                                  label: Text('${task.numberPriority}'),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(42.w, 29.h),
                                    backgroundColor: Colors.transparent,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: const BorderSide(
                                          color: AppColors.vistaBlue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
