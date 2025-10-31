import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/common/widgets/HBAppBar.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/containers/HBPrimaryHeaderContainer.dart';
import '../../../../common/widgets/images/HBCircleAvatarImage.dart';
import '../../../../common/widgets/textfields/HBSerachTextField.dart';
import '../../../../utils/constant/image_strings.dart';

class CategorySubcategory extends StatelessWidget {
  const CategorySubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HBPrimaryHeaderContainer(
              image: HBImages.walmartBackgroundImage,
              height: 0.42,
              child: Column(
                children: [
                  HBAppBar(
                    title: "Walmart",
                    backgroundColor: Colors.transparent,
                    titleColors: HBColors.white,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.shopping_cart),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  HBCircleAvatarImage(
                    image: HBImages.walmartBackgroundImage,
                    radius: 35.r,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '3456 Washington Street, Us, 6542',
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),

                  SizedBox(height: 20.h),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: HBSearchTextField(hintText: 'Search Walmart'),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Text(
                  "Category list or other widgets here",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
