import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';

class HBTextFormFieldTheme {
  HBTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: HBColors.darkGrey,
    suffixIconColor: HBColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: HBSizes.fontSizeMd,
      color: HBColors.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: HBSizes.fontSizeSm,
      color: HBColors.black,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: HBColors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HBColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HBColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HBColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HBColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: HBColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: HBColors.darkGrey,
    suffixIconColor: HBColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: HBSizes.fontSizeMd,
      color: HBColors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: HBSizes.fontSizeSm,
      color: HBColors.white,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: HBColors.white.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HBColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HBColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HBColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HBColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HBSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: HBColors.warning),
    ),
  );
}
