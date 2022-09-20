import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/routes.dart';
import 'package:uptodo/shared/common/app_colors.dart';
import 'package:uptodo/shared/common/app_defaults.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 14.h),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 58.h),
            Center(
              child: Text(
                'Welcome to UpTodo',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 26.h),
            Center(
              child: SizedBox(
                width: 287.w,
                child: Text(
                  'Please login to your account or create\nnew account to continue',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.white67),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.login),
                child: Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              child: ElevatedButton(
                onPressed: () {},
                style: AppDefaults.mBorderButtonStyle,
                child: Text(
                  'CREATE ACCOUNT',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
