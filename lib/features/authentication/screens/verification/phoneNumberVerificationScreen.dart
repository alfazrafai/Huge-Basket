import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huge_basket/common/widgets/button/HBPrimaryButton.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:huge_basket/utils/constant/image_strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/widgets/HBAppBar.dart';
import '../../../../common/widgets/button/HBTextButtonWithUnderline.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constant/text_string.dart';

class PhoneNumberVarificationScreen extends StatefulWidget {
  const PhoneNumberVarificationScreen({super.key});

  @override
  State<PhoneNumberVarificationScreen> createState() =>
      _PhoneNumberVarificationScreenState();
}

class _PhoneNumberVarificationScreenState
    extends State<PhoneNumberVarificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final String _correctOTP = "2211";

  void _verifyOTP() {
    final enteredOTP = _otpController.text.trim();

    if (enteredOTP == _correctOTP) {
      Get.offNamed(HBRoutes.navigationMain);
    } else {
      Get.snackbar(
        "Invalid OTP",
        "Please enter the correct verification code.",
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.redAccent,
        icon: const Icon(Icons.error_outline, color: Colors.redAccent),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HBAppBar(title: "Verification Code"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),

              // Instruction text
              Text(
                HBTexts.verificationText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 27.h),

              // OTP Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 251.w,
                  child: PinCodeTextField(
                    appContext: context,
                    controller: _otpController,
                    length: 4,
                    keyboardType: TextInputType.number,
                    cursorColor: HBColors.primary,
                    animationType: AnimationType.scale,
                    enableActiveFill: true,
                    textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    hintCharacter: '-',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 22,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      fieldHeight: 50.h,
                      fieldWidth: 50.h,
                      borderRadius: BorderRadius.circular(50),
                      activeFillColor: Colors.grey.shade100,
                      inactiveFillColor: Colors.grey.shade100,
                      selectedFillColor: Colors.grey.shade100,
                      activeColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      selectedColor: HBColors.primary.withOpacity(0.4),
                    ),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    animationDuration: const Duration(milliseconds: 200),
                    onChanged: (value) {},
                    onCompleted: (value) => _verifyOTP(),
                  ),
                ),
              ),

              SizedBox(height: 70.h),

              // Verify Button
              HBPrimaryButton(
                buttonText: "Verify",
                onTap: _verifyOTP, // 🔒 Validates OTP on button press too
              ),

              SizedBox(height: 30.h),

              /// Resend Button
              TextButtonWithUnderLine(
                text: 'Resend',
                onTap: () {
                  Get.snackbar(
                    "OTP Resent",
                    "A new verification code was sent.",
                    backgroundColor: HBColors.primary.withOpacity(0.1),
                    colorText: HBColors.primary,
                    icon: const Icon(Icons.send, color: HBColors.primary),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),

              SizedBox(height: 50.h),

              // Faint App Logo
              Opacity(
                opacity: 0.3,
                child: Image.asset(
                  HBImages.lightAppLogo,
                  height: 200.h,
                  width: 180.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
