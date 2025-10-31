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
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Business name',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  errorStyle: TextStyle(color: Colors.redAccent),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email can’t be empty';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
