import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huge_basket/utils/helpers/helper_funtion.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final dark = HBHelperFunctions.isDarkMode(context);

    return Positioned(
      top: HBDeviceUtils.getAppBarHeight(),
      right: HBSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: Text(
          'Skip',
          style: TextStyle(
            color: dark ? HBColors.white : HBColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.h,
          ),
        ),
      ),
    );
  }
}
