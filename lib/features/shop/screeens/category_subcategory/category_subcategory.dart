import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huge_basket/common/widgets/HBAppBar.dart';
import 'package:huge_basket/common/widgets/image_text/image_with_text.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/containers/HBPrimaryHeaderContainer.dart';
import '../../../../common/widgets/images/HBCircleAvatarImage.dart';
import '../../../../common/widgets/text/title_text_with_more_option.dart';
import '../../../../common/widgets/textfields/HBSerachTextField.dart';
import '../../../../utils/constant/image_strings.dart';
import '../../controller/CategoryController.dart';
import '../../models/productModel.dart';

class CategorySubcategory extends StatelessWidget {
  CategorySubcategory({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  final List<Product> products =
      []; // not used here, just keeping for reference

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🟩 Header Section
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
                        icon: const Icon(Iconsax.shopping_cart),
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
                    child: const HBSearchTextField(hintText: 'Search Walmart'),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              color: HBColors.primaryGreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose your Category",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.h),

                  Obx(() {
                    return SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryController.categories.length,
                        itemBuilder: (context, index) {
                          final category = categoryController.categories[index];

                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Obx(
                              () => HBImageWithText(
                                image: category.categoryImage,
                                categoryName: category.name,
                                isSelected: category
                                    .isSelected
                                    .value, // ✅ direct from model
                                onTap: () =>
                                    categoryController.changeCategory(category),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              color: HBColors.primaryGreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWithMoreOption(titleName: 'Subcategories'),
                  SizedBox(height: 12.h),

                  Obx(() {
                    final subcategories =
                        categoryController.selectedSubCategories;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: subcategories.map((sub) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          padding: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            sub,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: HBColors.black),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
