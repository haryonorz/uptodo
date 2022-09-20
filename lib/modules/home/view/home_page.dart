import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/focus/view/focus_page.dart';
import 'package:uptodo/modules/home/controller/home_controller.dart';
import 'package:uptodo/modules/home/view/add_task_buttom_sheet.dart';
import 'package:uptodo/modules/home/view/navbar_item.dart';
import 'package:uptodo/modules/calendar/view/calendar_page.dart';
import 'package:uptodo/modules/index/view/index_page.dart';
import 'package:uptodo/modules/profile/profile_page.dart';
import 'package:uptodo/shared/common/app_colors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedTabIndex.value,
          children: const [
            IndexPage(),
            CalendarPage(),
            FocusPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.jet,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: SizedBox(
            height: kToolbarHeight,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavbarItem(
                    iconPath: controller.selectedTabIndex.value == 0
                        ? 'assets/icons/tab_index_active.svg'
                        : 'assets/icons/tab_index.svg',
                    label: 'Index',
                    onTap: () {
                      controller.changeTabIndex(0);
                    },
                  ),
                  NavbarItem(
                    iconPath: controller.selectedTabIndex.value == 1
                        ? 'assets/icons/tab_calendar_active.svg'
                        : 'assets/icons/tab_calendar.svg',
                    label: 'Calendar',
                    onTap: () => controller.changeTabIndex(1),
                  ),
                  SizedBox(width: 24.w),
                  NavbarItem(
                    iconPath: controller.selectedTabIndex.value == 2
                        ? 'assets/icons/tab_focuse_active.svg'
                        : 'assets/icons/tab_focuse.svg',
                    label: 'Focuse',
                    onTap: () => controller.changeTabIndex(2),
                  ),
                  NavbarItem(
                    iconPath: controller.selectedTabIndex.value == 3
                        ? 'assets/icons/tab_profile_active.svg'
                        : 'assets/icons/tab_profile.svg',
                    label: 'Profile',
                    onTap: () => controller.changeTabIndex(3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 64.w,
        height: 64.h,
        decoration: const BoxDecoration(
          color: AppColors.vistaBlue,
          shape: BoxShape.circle,
        ),
        child: RawMaterialButton(
          onPressed: () {
            Get.bottomSheet(
              const AddTaskButtomSheet(),
              backgroundColor: AppColors.jet,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            );
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
