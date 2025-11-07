import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HBCircularImage extends StatelessWidget {
  const HBCircularImage({
    super.key,
    required this.circleImage,
    this.isSelected = false,
  });

  final String circleImage;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.all(5.h),
      margin: const EdgeInsets.all(5),
      height: 65.h,
      width: 65.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.green.withOpacity(0.15) : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: isSelected ? 3 : 1.5,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: ClipOval(child: Image.asset(circleImage, fit: BoxFit.cover)),
    );
  }
}
