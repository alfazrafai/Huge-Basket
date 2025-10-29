import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class HBChipTheme {
  HBChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: HBColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: HBColors.black),
    selectedColor: HBColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: HBColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: HBColors.darkerGrey,
    labelStyle: TextStyle(color: HBColors.white),
    selectedColor: HBColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: HBColors.white,
  );
}
