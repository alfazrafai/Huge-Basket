import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/helpers/helper_funtion.dart';

class OnBoardingPage extends StatelessWidget {
  final String image, title, subtitle;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = HBHelperFunctions.screenHeight();
    final dark = HBHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HBSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Image
          SizedBox(height: 150.h),
          SizedBox(
            height: screenHeight * 0.3, // slightly smaller and consistent
            child: Image.asset(
              image,
              fit: BoxFit
                  .contain, // ensures no extra whitespace from the image itself
            ),
          ),

          const SizedBox(height: HBSizes.spaceBtwSections),

          /// Title
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 33.h),

          /// Subtitle
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              color: dark
                  ? HBColors.grey.withOpacity(0.5)
                  : HBColors.borderPrimary.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
