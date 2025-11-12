import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/HBAppBar.dart';

import '../../../../common/widgets/card/productCard.dart';
import '../../../../utils/constant/colors.dart';
import '../../controller/product_view_controller.dart';
import '../../models/productModel.dart';

class SubCategoryProductScreen extends StatelessWidget {
  final String subCategoryName;
  final List<ProductModel> products;

  SubCategoryProductScreen({
    super.key,
    required this.subCategoryName,
    required this.products,
  });

  final ProductViewController viewController = Get.put(ProductViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HBColors.primaryGreenBackground,
      body: Column(
        children: [
          /// 🧱 AppBar with Grid/List Toggle
          Obx(
            () => HBAppBar(
              title: subCategoryName,
              backgroundColor: Colors.white,
              showCart: true,
              actions: [
                IconButton(
                  icon: Icon(
                    viewController.isGridView.value
                        ? Icons.list_alt
                        : Icons.grid_view_rounded,
                    color: Colors.black87,
                  ),
                  onPressed: viewController.toggleView,
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          /// 🧱 Product Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Obx(() {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: viewController.isGridView.value
                      ? _buildGridView()
                      : _buildListView(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  /// 🟩 Grid View
  Widget _buildGridView() {
    return GridView.builder(
      key: const ValueKey("gridView"),
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return HBProductCard(product: product);
      },
    );
  }

  /// 🟦 List View
  Widget _buildListView() {
    return ListView.separated(
      key: const ValueKey("listView"),
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildListProductCard(context, product);
      },
    );
  }

  /// 🧱 Custom List View Card
  Widget _buildListProductCard(BuildContext context, ProductModel product) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              product.image,
              height: 80.h,
              width: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  product.quantity,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 6.h),
                Obx(
                  () => Text(
                    "₹ ${product.totalPrice.value.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: HBColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 🧩 Add/Counter only
          HBProductCard(product: product, showOnlyControls: true),
        ],
      ),
    );
  }
}
