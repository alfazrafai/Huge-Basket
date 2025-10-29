import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_funtion.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HBHelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());

    return Positioned(
      bottom: HBDeviceUtils.getBottomNavigationBarHeight() + 10,
      right: HBSizes.defaultSpace,
      child: Obx(
        () => ElevatedButton(
          onPressed: () => controller.nextPage(),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(70, 36),
            padding: EdgeInsets.zero,
            backgroundColor: dark ? HBColors.primary : HBColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            controller.currentIndex.value == 2 ? "Go" : "Next",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
