import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class HBElevatedButtonTheme {
  HBElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HBColors.light,
      backgroundColor: HBColors.primary,
      disabledForegroundColor: HBColors.darkGrey,
      disabledBackgroundColor: HBColors.buttonDisabled,
      side: const BorderSide(color: HBColors.lightContainer),
      padding: const EdgeInsets.symmetric(vertical: HBSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: HBColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HBSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HBColors.light,
      backgroundColor: HBColors.primary,
      disabledForegroundColor: HBColors.darkGrey,
      disabledBackgroundColor: HBColors.darkerGrey,
      side: const BorderSide(color: HBColors.primary),
      padding: const EdgeInsets.symmetric(vertical: HBSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: HBColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HBSizes.buttonRadius),
      ),
    ),
  );
}
