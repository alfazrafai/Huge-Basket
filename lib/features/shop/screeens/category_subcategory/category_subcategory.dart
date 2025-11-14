// lib/features/shop/screens/category_subcategory.dart
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
import '../../../home/model/store_model.dart';
import '../../controller/CategoryController.dart';
import '../../models/productModel.dart';
import '../product/subcategory_product_screen.dart';

class CategorySubcategory extends StatelessWidget {
  CategorySubcategory({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    // receive the StoreModel passed via Get.arguments
    final store = Get.arguments as StoreModel;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HBPrimaryHeaderContainer(
              image: store.storeHeadingImage,
              height: 0.42,
              child: Column(
                children: [
                  HBAppBar(
                    title: store.name,
                    backgroundColor: Colors.transparent,
                    titleColor: Colors.white,
                    iconColor: Colors.white,
                    showCart: true,
                  ),
                  SizedBox(height: 10.h),
                  HBCircleAvatarImage(image: store.image, radius: 35.r),
                  SizedBox(height: 10.h),
                  Text(
                    store.address,
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: HBSearchTextField(
                      hintText: 'Search in ${store.name}',
                    ),
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
                                isSelected: category.isSelected.value,
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
                      final hasMore = subCat.products.length > 1;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),

                          TitleTextWithMoreOption(
                            titleName: subCat.name,
                            moreText: hasMore ? 'More >' : null,
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

                          SizedBox(
                            height: 220.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: subCat.products.length > 5
                                  ? 6
                                  : subCat.products.length,
                              itemBuilder: (context, index) {
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
