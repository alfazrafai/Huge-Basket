import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:huge_basket/routes/routes.dart';
import 'package:huge_basket/utils/constant/image_strings.dart';

import '../../../../common/widgets/button/HBPrimaryButton.dart';
import '../../../../utils/constant/colors.dart';
import '../../../../utils/helpers/helper_funtion.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HBHelperFunctions.isDarkMode(context);
    final phoneController = TextEditingController();

    void handleLogin() {
      final phone = phoneController.text.trim();

      if (phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter your phone number.'),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      if (phone.length < 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid 10-digit phone number.'),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      // Navigator.pushReplacementNamed(context, '/home');
      Get.offNamed(HBRoutes.phoneVerification);
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                height: 250.h,
                width: 300.w,
                dark ? HBImages.darkAppLogo : HBImages.lightAppLogo,
              ),
              SizedBox(height: 45.h),
              Container(
                height: 50.h,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: HBColors.primaryGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '+1',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 1,
                      height: 23.h,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Phone Number',
                          counterText: "",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              HBPrimaryButton(onTap: handleLogin, buttonText: "Login"),
            ],
          ),
        ),
      ),
    );
  }
}
