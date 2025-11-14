import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:huge_basket/features/authentication/screens/login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  /// Update dots when user swipes
  void updatePageIndicator(int index) {
    currentIndex.value = index;
  }

  /// When user taps a dot indicator
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Next button logic
  void nextPage() {
    if (currentIndex.value == 2) {
      _completeOnBoarding();
    } else {
      currentIndex.value++;
      pageController.jumpToPage(currentIndex.value);
    }
  }

  /// Skip button logic
  void skipPage() {
    _completeOnBoarding();
  }

  /// Save onboarding status in Hive
  void _completeOnBoarding() {
    final box = Hive.box('appData');
    box.put('IsFirstTime', false);
    Get.offAll(() => const LoginScreen());
  }
}
