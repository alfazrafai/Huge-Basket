import 'package:flutter/material.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:huge_basket/utils/theme/widget_themes/appbar_theme.dart';
import 'package:huge_basket/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:huge_basket/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:huge_basket/utils/theme/widget_themes/chip_theme.dart';
import 'package:huge_basket/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:huge_basket/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:huge_basket/utils/theme/widget_themes/text_field_theme.dart';
import 'package:huge_basket/utils/theme/widget_themes/text_theme.dart';

class HBAppTheme {
  HBAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Objectivity',
    disabledColor: HBColors.grey,
    brightness: Brightness.light,
    primaryColor: HBColors.primary,
    textTheme: HBTextTheme.lightTextTheme,
    chipTheme: HBChipTheme.lightChipTheme,
    scaffoldBackgroundColor: HBColors.white,
    appBarTheme: HBAppBarTheme.lightAppBarTheme,
    checkboxTheme: HBCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: HBBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: HBElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: HBOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: HBTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Objectivity',
    disabledColor: HBColors.grey,
    brightness: Brightness.dark,
    primaryColor: HBColors.primary,
    textTheme: HBTextTheme.darkTextTheme,
    chipTheme: HBChipTheme.darkChipTheme,
    scaffoldBackgroundColor: HBColors.black,
    appBarTheme: HBAppBarTheme.darkAppBarTheme,
    checkboxTheme: HBCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: HBBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: HBElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: HBOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: HBTextFormFieldTheme.darkInputDecorationTheme,
  );
}
