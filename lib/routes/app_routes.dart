import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:huge_basket/features/authentication/screens/login/login_screen.dart';
import 'package:huge_basket/features/home/screens/homeScreen.dart';
import 'package:huge_basket/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: HBRoutes.home, page: () => const HomeScreen()),
    GetPage(name: HBRoutes.login, page: () => const LoginScreen()),
  ];
}
