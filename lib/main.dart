import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huge_basket/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:huge_basket/routes/app_routes.dart';
import 'package:huge_basket/utils/theme/theme.dart';

void main() {
  runApp(HugeBasket());
}

class HugeBasket extends StatelessWidget {
  const HugeBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: HBAppTheme.lightTheme,
        darkTheme: HBAppTheme.darkTheme,
        getPages: AppRoutes.pages,
        home: OnBoardingScreen(),
      ),
    );
  }
}
