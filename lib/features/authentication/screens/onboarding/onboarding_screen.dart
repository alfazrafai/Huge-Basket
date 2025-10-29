import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huge_basket/features/authentication/screens/onboarding/widget/onboarding_dot_navigator.dart';
import 'package:huge_basket/features/authentication/screens/onboarding/widget/onboarding_item.dart';
import 'package:huge_basket/features/authentication/screens/onboarding/widget/onboarding_next_button.dart';
import 'package:huge_basket/features/authentication/screens/onboarding/widget/onboarding_skip.dart';

import '../../../../utils/constant/image_strings.dart';
import '../../../../utils/constant/text_string.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: HBImages.onBoardingImage1,
                title: HBTexts.onBoardingTitle1,
                subtitle: HBTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: HBImages.onBoardingImage2,
                title: HBTexts.onBoardingTitle2,
                subtitle: HBTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: HBImages.onBoardingImage3,
                title: HBTexts.onBoardingTitle3,
                subtitle: HBTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          const OnBoardingSkip(),

          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
