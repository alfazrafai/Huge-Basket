import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:huge_basket/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:huge_basket/routes/app_routes.dart';
import 'package:huge_basket/utils/theme/theme.dart';
import 'features/authentication/screens/login/login_screen.dart';
import 'features/cart/controller/CartController.dart';
import 'features/user/profile/model/address_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Get.put(CartController());

  // Register Hive adapters
  Hive.registerAdapter(AddressModelAdapter());

  // Open boxes
  await Hive.openBox('appData'); // <-- For onboarding
  await Hive.openBox<AddressModel>('addresses'); // <-- For addresses

  // Read onboarding value
  final appBox = Hive.box('appData');
  final isFirstTime = appBox.get('IsFirstTime', defaultValue: true);

  runApp(HugeBasket(isFirstTime: isFirstTime));
}

class HugeBasket extends StatelessWidget {
  final bool isFirstTime;

  const HugeBasket({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: HBAppTheme.lightTheme,
        darkTheme: HBAppTheme.darkTheme,
        getPages: AppRoutes.pages,
        home: isFirstTime ? OnBoardingScreen() : LoginScreen(),
      ),
    );
  }
}
