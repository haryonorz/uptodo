import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uptodo/shared/common/common.dart';

class CustomAlertDialog extends StatelessWidget {
  final String titleText;
  final Widget body;
  final String noText;
  final bool usingNoButton;
  final VoidCallback? onNoPressed;
  final String yesText;
  final VoidCallback? onYesPressed;

  const CustomAlertDialog({
    Key? key,
    required this.titleText,
    required this.body,
    this.usingNoButton = true,
    this.noText = 'Cancel',
    this.onNoPressed,
    this.yesText = 'Edit',
    this.onYesPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      title: Center(
        child: Text(
          titleText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
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
            child: body,
          ),
          SizedBox(height: 28.h),
          Row(
            children: [
              usingNoButton
                  ? Expanded(
                      child: TextButton(
                        onPressed: onNoPressed ??
                            () {
                              Get.back();
                            },
                        child: Text(noText),
                      ),
                    )
                  : Container(),
              Expanded(
                child: ElevatedButton(
                  onPressed: onYesPressed ??
                      () {
                        Get.back();
                      },
                  child: Text(yesText),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
      titlePadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 10.h,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      backgroundColor: AppColors.jet,
    );
  }
}
