import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/HBAppBar.dart';
import '../../../../common/widgets/card/productCard.dart';
import '../../../../utils/constant/colors.dart';
import '../../models/productModel.dart';

class SubCategoryProductScreen extends StatelessWidget {
  final String subCategoryName;
  final List<ProductModel> products;

  const SubCategoryProductScreen({
    super.key,
    required this.subCategoryName,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HBColors.primaryGreenBackground,
      body: Column(
        children: [
          /// 🧱 AppBar with dynamic subcategory name
          HBAppBar(
            title: subCategoryName, // ✅ Use subcategory name dynamically
            backgroundColor: Colors.white,
            showCart: true,
          ),

          SizedBox(height: 10.h),

          /// 🧱 Product Grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns like your screenshot
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.72, // Adjust for image height
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return HBProductCard(product: product);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
