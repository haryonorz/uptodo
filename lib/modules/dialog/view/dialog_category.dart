import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/models/task_category.dart';
import 'package:uptodo/modules/dialog/controller/dialog_controller.dart';
import 'package:uptodo/routes/routes.dart';
import 'package:uptodo/shared/common/common.dart';

class DialogCategory extends StatelessWidget {
  final _controller = Get.put(DialogController());

  DialogCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      title: Center(
        child: Text(
          'Choose Category',
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
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                listCategoryTask.length + 1,
                (index) => GestureDetector(
                  onTap: () {
                    if (index == listCategoryTask.length) {
                      Get.toNamed(AppRoutes.addTaskCategory);
                    } else {
                      _controller.changeCategoryIndex(index);
                    }
                  },
                  child: Column(
                    children: [
                      Obx(() {
                        return Container(
                          width: 64.w,
                          height: 64.h,
                          decoration: BoxDecoration(
                            color: index != listCategoryTask.length
                                ? listCategoryTask[index].color
                                : const Color(0xFF80FFD1),
                            borderRadius: BorderRadius.circular(4),
                            border:
                                index == _controller.selectedCategoryIndex.value
                                    ? Border.all(
                                        width: 4,
                                        color: AppColors.violetAreBlue,
                                      )
                                    : null,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              index != listCategoryTask.length
                                  ? listCategoryTask[index].iconPath
                                  : 'assets/icons/label_add.svg',
                              width: 32.w,
                              height: 32.h,
                              color: AppColors.charlestonGreen.withOpacity(.7),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 5.h),
                      Text(
                        index != listCategoryTask.length
                            ? listCategoryTask[index].name
                            : 'Create New',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Add Category',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
