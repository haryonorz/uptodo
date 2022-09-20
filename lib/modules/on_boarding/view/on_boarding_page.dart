import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/on_boarding/controller/on_boarding_controller.dart';
import 'package:uptodo/routes/app_pages.dart';
import 'package:uptodo/shared/common/common.dart';

class OnBoardingPage extends GetView<OnBoardingController> {
  const OnBoardingPage({Key? key}) : super(key: key);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      duration: const Duration(milliseconds: 400),
      height: 4,
      width: controller.selectedPageIndex.value == index ? 26 : 18,
      decoration: BoxDecoration(
        color: controller.selectedPageIndex.value == index
            ? AppColors.white87
            : AppColors.silverFoil,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.selectedPageIndex,
              itemCount: controller.onBoardingContents.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 40.h),
                    Center(
                      child: SizedBox(
                        height: 280,
                        child: SvgPicture.asset(
                          controller.onBoardingContents[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 105.h),
                    Center(
                      child: Text(
                        controller.onBoardingContents[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 42.h),
                    Center(
                      child: SizedBox(
                        width: 300.w,
                        child: Text(
                          controller.onBoardingContents[index].subTitle,
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                );
              },
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15.w, top: 14.h),
                  child: TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.welcome),
                    child: Text(
                      'SKIP',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.white44),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 370.h,
              child: SizedBox(
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.onBoardingContents.length,
                    (index) => Obx(() {
                      return dotIndicator(index);
                    }),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 15.w,
                    right: 24.w,
                    bottom: 30.h,
                  ),
                  child: Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        controller.selectedPageIndex.value == 0
                            ? Container()
                            : TextButton(
                                onPressed: controller.backwardAction,
                                child: Text(
                                  'BACK',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: AppColors.white44),
                                ),
                              ),
                        ElevatedButton(
                          onPressed: controller.forwardAction,
                          child: Text(
                            controller.isLastPage ? 'GET STARTED' : 'NEXT',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
