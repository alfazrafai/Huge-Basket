import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';

class HBSearchTextField extends StatelessWidget {
  const HBSearchTextField({
    super.key,
    required this.hintText,
    required TextStyle hintStyle,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: HBColors.grey, fontSize: 14.sp),
        prefixIcon: const Icon(Iconsax.search_normal),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
