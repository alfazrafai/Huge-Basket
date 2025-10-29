import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huge_basket/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:huge_basket/utils/constant/sizes.dart';
import 'package:huge_basket/utils/device/device_utility.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the controller instance
    final controller = OnBoardingController.instance;

    return Positioned(
      // Position the dots at the bottom-center
      bottom:
          HBDeviceUtils.getBottomNavigationBarHeight() + HBSizes.defaultSpace,
      left: HBSizes.defaultSpace,
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Total number of pages (3 in your case)
            for (int i = 0; i < 3; i++)
              Indicator(
                // Use the controller's page index to determine active state
                isActive: controller.currentIndex.value == i,
              ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({required this.isActive, super.key});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      // Active indicator is an elongated bar, inactive is a small circle
      width: isActive ? 25 : 7, // Active width: 20, Inactive width: 6
      height: 7,

      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: isActive ? HBColors.primary : HBColors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
