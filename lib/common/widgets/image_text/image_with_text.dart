import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../images/HBCircularImage.dart';

class HBImageWithText extends StatelessWidget {
  const HBImageWithText({
    super.key,
    required this.image,
    required this.categoryName,
    this.onTap,
    this.isSelected = false,
  });

  final String categoryName;
  final String image;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          HBCircularImage(circleImage: image, isSelected: isSelected),
          SizedBox(height: 4.h),
          SizedBox(
            width: 66.w,
            child: Text(
              categoryName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: isSelected ? Colors.green : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
