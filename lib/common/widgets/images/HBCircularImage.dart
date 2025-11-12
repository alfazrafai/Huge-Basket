import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HBCircularImage extends StatelessWidget {
  const HBCircularImage({
    super.key,
    required this.circleImage,
    this.isSelected = false,
    this.size = 65, // ✅ customizable diameter
  });

  final String circleImage;
  final bool isSelected;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: size.h,
      width: size.h, // ✅ same height & width = perfect circle

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: isSelected ? 2 : 0,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),

      /// 🖼️ Image perfectly clipped as circle
      child: Padding(
        padding: EdgeInsets.all(4.w), // ✅ inner spacing
        child: ClipOval(
          child: Image.asset(
            circleImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
