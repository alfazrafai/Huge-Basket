import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/sizes.dart';

class HBAppBarTheme {
  HBAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: HBColors.black, size: HBSizes.iconMd),
    actionsIconTheme: IconThemeData(
      color: HBColors.black,
      size: HBSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: HBColors.black,
    ),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: HBColors.black, size: HBSizes.iconMd),
    actionsIconTheme: IconThemeData(
      color: HBColors.white,
      size: HBSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: HBColors.white,
    ),
  );
}
