import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:huge_basket/features/authentication/screens/login/login_screen.dart';
import 'package:huge_basket/features/authentication/screens/register/registration_screen.dart'
    hide PhoneNumberVarificationScreen;
import 'package:huge_basket/features/home/screens/homeScreen.dart';
import 'package:huge_basket/features/shop/screeens/category_subcategory/category_subcategory.dart';
import 'package:huge_basket/navigation_bar.dart';
import 'package:huge_basket/routes/routes.dart';

import '../features/authentication/screens/verification/phoneNumberVerificationScreen.dart';
import '../features/user/profile/screen/address/manage_adress_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: HBRoutes.home, page: () => HomeScreen()),
    GetPage(name: HBRoutes.login, page: () => const LoginScreen()),
    GetPage(
      name: HBRoutes.phoneVerification,
      page: () => PhoneNumberVarificationScreen(),
    ),
    GetPage(name: HBRoutes.register, page: () => const RegistrationScreen()),
    GetPage(
      name: HBRoutes.categorySubCategory,
      page: () => CategorySubcategory(),
    ),
    GetPage(name: HBRoutes.manageAddress, page: () => ManageAddressScreen()),
    GetPage(name: HBRoutes.navigationMain, page: () => NavigationScreen()),
  ];
}
