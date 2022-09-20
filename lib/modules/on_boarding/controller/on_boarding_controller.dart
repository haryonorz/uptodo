import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/models/on_boarding.dart';
import 'package:uptodo/routes/app_pages.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage =>
      selectedPageIndex.value == onBoardingContents.length - 1;

  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.toNamed(AppRoutes.welcome);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  backwardAction() {
    if (selectedPageIndex.value != 0) {
      pageController.previousPage(
          duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoarding> onBoardingContents = [
    OnBoarding(
      title: 'Manage your tasks',
      subTitle:
          'You can easily manage all of your daily\ntasks in DoMe for free',
      image: 'assets/icons/onboarding-01.svg',
    ),
    OnBoarding(
      title: 'Create daily routine',
      subTitle:
          'In Uptodo  you can create your\npersonalized routine to stay productive',
      image: 'assets/icons/onboarding-02.svg',
    ),
    OnBoarding(
      title: 'Orgonaize your tasks',
      subTitle:
          'You can organize your daily tasks by\nadding your tasks into separate categories',
      image: 'assets/icons/onboarding-03.svg',
    ),
  ];
}
