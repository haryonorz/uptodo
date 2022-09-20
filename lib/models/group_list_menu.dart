import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uptodo/models/menu.dart';
import 'package:uptodo/routes/routes.dart';
import 'package:uptodo/shared/common/app_colors.dart';
import 'package:uptodo/shared/widgets/custom_alert_dialog.dart';
import 'package:uptodo/modules/profile/account_image_buttom_sheet.dart';
import 'package:uptodo/shared/widgets/text_form_field_label.dart';

class GroupListMenu {
  final String groupName;
  final List<Menu> listMenu;

  GroupListMenu({
    required this.groupName,
    required this.listMenu,
  });
}

List<GroupListMenu> profileMenu = [
  GroupListMenu(
    groupName: 'Settings',
    listMenu: [
      Menu(
        iconPath: 'assets/icons/ic_setting.svg',
        title: 'App Settings',
        onTap: () => Get.toNamed(AppRoutes.settings),
      )
    ],
  ),
  GroupListMenu(
    groupName: 'Account',
    listMenu: [
      Menu(
        iconPath: 'assets/icons/ic_user.svg',
        title: 'Change account name',
        onTap: () {
          Get.dialog(
            CustomAlertDialog(
              titleText: 'Change account name',
              body: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Enter your Fullname',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      Menu(
        iconPath: 'assets/icons/ic_key.svg',
        title: 'Change account password',
        onTap: () {
          Get.dialog(
            CustomAlertDialog(
              titleText: 'Change account password',
              body: Column(
                children: [
                  const TextFormFieldLabel(
                    labelText: 'Enter old Password',
                    hintText: 'Enter your Old Password',
                    obscureText: true,
                    fillColor: Colors.transparent,
                  ),
                  SizedBox(height: 10.h),
                  const TextFormFieldLabel(
                    labelText: 'Enter new Password',
                    hintText: 'Enter your New Password',
                    obscureText: true,
                    fillColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      Menu(
        iconPath: 'assets/icons/ic_camera.svg',
        title: 'Change account image',
        onTap: () {
          Get.bottomSheet(
            const AccountImageButtomSheet(),
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
      ),
    ],
  ),
  GroupListMenu(
    groupName: 'Uptodo',
    listMenu: [
      Menu(
        iconPath: 'assets/icons/ic_menu.svg',
        title: 'About US',
        onTap: () {},
      ),
      Menu(
        iconPath: 'assets/icons/ic_info_circle.svg',
        title: 'FAQ',
        onTap: () {},
      ),
      Menu(
        iconPath: 'assets/icons/ic_flash.svg',
        title: 'Help & Feedback',
        onTap: () {},
      ),
      Menu(
        iconPath: 'assets/icons/ic_like.svg',
        title: 'Support US',
        onTap: () {},
      ),
      Menu(
        iconPath: 'assets/icons/ic_logout.svg',
        title: 'Log out',
        onTap: () {},
        menuColor: AppColors.tartOrange,
        showTrailing: false,
      ),
    ],
  ),
];

List<GroupListMenu> settingsMenu = [
  GroupListMenu(
    groupName: 'Settings',
    listMenu: [
      Menu(
        iconPath: 'assets/icons/ic_brush.svg',
        title: 'Change app color',
        onTap: () {},
      ),
      Menu(
        iconPath: 'assets/icons/ic_text.svg',
        title: 'Change app typography',
        onTap: () {},
      ),
      Menu(
        iconPath: 'assets/icons/ic_language_square.svg',
        title: 'Change app language',
        onTap: () {},
      ),
    ],
  ),
  GroupListMenu(
    groupName: 'Import',
    listMenu: [
      Menu(
        iconPath: 'assets/icons/ic_import.svg',
        title: 'Import from Google calendar',
        onTap: () {},
      ),
    ],
  ),
];
