import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/login/view/login_form_view.dart';
import 'package:uptodo/routes/routes.dart';
import 'package:uptodo/shared/common/app_colors.dart';
import 'package:uptodo/shared/common/app_defaults.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            SizedBox(height: 40.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Expanded(child: LoginFormView()),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: double.infinity,
                      height: 24.h,
                      child: Stack(
                        children: [
                          const Center(
                            child: Divider(
                              thickness: 1,
                              height: 1,
                              color: AppColors.spanishGrey,
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 16.w,
                              color: AppColors.chineseBlack,
                              child: Text(
                                'or',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: AppColors.spanishGrey),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: AppDefaults.sBorderButtonStyle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/logo_google.svg'),
                            SizedBox(width: 10.w),
                            Text(
                              'Login with Google',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: AppDefaults.sBorderButtonStyle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/logo_apple.svg'),
                            SizedBox(width: 10.w),
                            Text(
                              'Login with Apple',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 46.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Don’t have an account? ',
                          children: [
                            TextSpan(
                              text: 'Register',
                              style: Theme.of(context).textTheme.caption,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(AppRoutes.register),
                            ),
                          ],
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: AppColors.spanishGrey,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
