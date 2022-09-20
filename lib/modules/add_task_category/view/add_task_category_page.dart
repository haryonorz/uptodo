import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/add_task_category/controller/add_task_category_controller.dart';
import 'package:uptodo/shared/common/common.dart';
import 'package:uptodo/shared/widgets/text_form_field_label.dart';

class AddTasCategoryPage extends GetView<AddTaskCategoryController> {
  const AddTasCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new category'),
        elevation: 0,
        titleSpacing: 24.w,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const TextFormFieldLabel(
                    labelText: 'Category name:',
                    hintText: 'Category name',
                    fillColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'Category icon:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.quartz,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                    child: const Text('Choose icon from library'),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'Category color:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 36.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      controller.listCategoryColor.length,
                      (index) => GestureDetector(
                        onTap: () {
                          controller.selectedColor(index);
                        },
                        child: Container(
                          width: 36.w,
                          margin: EdgeInsets.only(
                            left: index == 0 ? 24.w : 12.w,
                            right:
                                index == controller.listCategoryColor.length - 1
                                    ? 24.w
                                    : 0.w,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.listCategoryColor[index],
                          ),
                          child: Obx(() {
                            if (index == controller.selectedColorIndex.value) {
                              return Icon(
                                Icons.done,
                                color:
                                    AppColors.charlestonGreen.withOpacity(.7),
                              );
                            } else {
                              return Container();
                            }
                          }),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Row(
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
                    child: const Text('Create Category'),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
