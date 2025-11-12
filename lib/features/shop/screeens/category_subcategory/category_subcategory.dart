import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huge_basket/common/widgets/HBAppBar.dart';
import 'package:huge_basket/common/widgets/image_text/image_with_text.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/card/productCard.dart';
import '../../../../common/widgets/containers/HBPrimaryHeaderContainer.dart';
import '../../../../common/widgets/images/HBCircleAvatarImage.dart';
import '../../../../common/widgets/text/title_text_with_more_option.dart';
import '../../../../common/widgets/textfields/HBSerachTextField.dart';
import '../../../../utils/constant/image_strings.dart';
import '../../controller/CategoryController.dart';
import '../../models/productModel.dart';
import '../product/subcategory_product_screen.dart';

class CategorySubcategory extends StatelessWidget {
  CategorySubcategory({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  // final List<Product> products =
  //     []; // not used here, just keeping for reference

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
                    titleColor: Colors.white,
                    iconColor: Colors.white,
                    showCart: true, // ✅ shows badge
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

            SizedBox(height: 20.h),

            Container(
              color: HBColors.primaryGreenBackground,
              child: Obx(() {
                final selected = categoryController.selectedCategory.value;
                if (selected == null) return const SizedBox();

                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: selected.subCategories.map((subCat) {
                      // ✅ if more than one product, show "More >"
                      final hasMore = subCat.products.length > 1;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),

                          /// 🧱 Reusable TitleTextWithMoreOption widget
                          TitleTextWithMoreOption(
                            titleName: subCat.name,
                            moreText: hasMore
                                ? 'More >'
                                : null, // hide when not needed
                            onTap: hasMore
                                ? () {
                                    Get.to(
                                      () => SubCategoryProductScreen(
                                        subCategoryName: subCat.name,
                                        products: subCat.products,
                                      ),
                                    );
                                  }
                                : null,
                          ),

                          SizedBox(height: 5.h),

                          /// 🧱 Product horizontal list (limit to 5 for preview)
                          SizedBox(
                            height: 220.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: subCat.products.length > 5
                                  ? 6 // show 5 + 1 "More" card
                                  : subCat.products.length,
                              itemBuilder: (context, index) {
                                // 🧠 If index < 5 → show product card
                                if (index < 5 &&
                                    index < subCat.products.length) {
                                  final product = subCat.products[index];
                                  return HBProductCard(product: product);
                                }

                                if (index == 5 && subCat.products.length > 5) {
                                  return _buildMoreCard(
                                    context,
                                    subCat.name,
                                    subCat.products,
                                  );
                                }

                                return const SizedBox.shrink();
                              },
                            ),
                          ),

                          SizedBox(height: 20.h),

                          SizedBox(height: 20.h),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMoreCard(
  BuildContext context,
  String subCategoryName,
  List<ProductModel> products,
) {
  return GestureDetector(
    onTap: () {
      Get.to(
        () => SubCategoryProductScreen(
          subCategoryName: subCategoryName,
          products: products,
        ),
      );
    },
    child: Container(
      width: 45.w,
      height: 45.h,
      margin: EdgeInsets.only(right: 12.w, top: 12.h),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: HBColors.primary.withOpacity(0.1),
        border: Border.all(color: HBColors.primary, width: 2),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_forward, color: HBColors.primary, size: 32),
          ],
        ),
      ),
    ),
  );
}
