import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class HBOutlinedButtonTheme {
  HBOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: HBColors.dark,
      side: const BorderSide(color: HBColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: HBColors.black,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: HBSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HBSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: HBColors.light,
      side: const BorderSide(color: HBColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: HBColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: HBSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HBSizes.buttonRadius),
      ),
    ),
  );
}
