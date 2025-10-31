import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/common/widgets/button/HBPrimaryButton.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:huge_basket/utils/constant/image_strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/widgets/HBAppBar.dart';
import '../../../../common/widgets/button/HBTextButtonWithUnderline.dart';
import '../../../../utils/constant/text_string.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HBAppBar(title: "Add More Detail"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 251.w,
                  child: PinCodeTextField(
                    appContext: context,
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
                    onCompleted: (value) {
                      print("OTP Completed: $value");
                    },
                  ),
                ),
              ),
              SizedBox(height: 70.h),
              HBPrimaryButton(buttonText: "Verify", onTap: () => {}),
              SizedBox(height: 30.h),
              TextButtonWithUnderLine(text: 'Resend', onTap: () {}),
              SizedBox(height: 50.h),
              Container(
                height: 200.h,
                width: 180.w,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    HBImages.lightAppLogo,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
