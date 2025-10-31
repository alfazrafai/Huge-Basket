import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HBPrimaryHeaderContainer extends StatelessWidget {
  const HBPrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.image,
    this.height = 0.3, // proportion of screen height
    this.overlayColor = const Color(0x66000000), // black with opacity
  });

  final Widget child;
  final String image;
  final double height;
  final Color overlayColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: 290.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(overlayColor, BlendMode.darken),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: child,
        ),
      ],
    );
  }
}
