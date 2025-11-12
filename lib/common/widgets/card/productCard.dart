import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/constant/colors.dart';
import '../../../features/cart/controller/CartController.dart';
import '../../../features/shop/models/productModel.dart';

class HBProductCard extends StatelessWidget {
  final ProductModel product;

  const HBProductCard({super.key, required this.product});

  static const int maxQuantity = 5; // ✅ Limit to 5 items

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Obx(() {
      final bool isAdded = product.count.value > 0;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          //  MAIN PRODUCT CARD
          Container(
            width: 160.w,
            margin: EdgeInsets.only(right: 12.w, top: 12.h),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  IMAGE
                Center(
                  child: Image.asset(
                    product.image,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 8.h),

                // TOTAL PRICE + QUANTITY
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Show total price dynamically
                    Obx(
                      () => Text(
                        "₹ ${product.totalPrice.value.toStringAsFixed(2)}"
                        "${product.count.value > 0 ? "" : ""}",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                      ),
                    ),
                    Text(
                      product.quantity,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),

                // PRODUCT NAME
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // ➕ ADD BUTTON / COUNTER STACKED ON CARD
          Positioned(
            top: 20.h,
            right: 20.w,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: isAdded
                  ? _buildCounterBox(product, cartController)
                  : _buildDottedAddButton(product, cartController),
            ),
          ),
        ],
      );
    });
  }

  /// ➕ Dotted “Add” button
  Widget _buildDottedAddButton(
    ProductModel product,
    CartController cartController,
  ) {
    return GestureDetector(
      onTap: () {
        if (product.count.value >= maxQuantity) {
          _showMaxLimitDialog();
          return;
        }

        product.count.value++;
        product.updateTotal();
        cartController.addProduct(product);
      },
      child: DottedBorder(
        color: HBColors.primary,
        strokeWidth: 1.5,
        dashPattern: const [4, 2],
        borderType: BorderType.Circle,
        padding: EdgeInsets.all(6.w),
        child: const Icon(Icons.add, color: HBColors.primary, size: 18),
      ),
    );
  }

  /// Vertical counter box
  Widget _buildCounterBox(ProductModel product, CartController cartController) {
    return Container(
      key: const ValueKey('counter'),
      height: 90.h,
      width: 38.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: HBColors.primary, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ➕ Increase quantity
          GestureDetector(
            onTap: () {
              if (product.count.value >= maxQuantity) {
                _showMaxLimitDialog();
                return;
              }
              product.count.value++;
              product.updateTotal();
            },
            child: const Icon(Icons.add, color: HBColors.primary, size: 18),
          ),

          // Quantity
          Text(
            "${product.count.value}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),

          //  Decrease or remove
          GestureDetector(
            onTap: () {
              if (product.count.value > 1) {
                product.count.value--;
                product.updateTotal();
              } else {
                product.count.value = 0;
                product.updateTotal();
                cartController.removeProduct(product);
              }
            },
            child: Icon(
              product.count.value > 1 ? Icons.remove : Icons.delete_outline,
              color: product.count.value > 1
                  ? HBColors.primary
                  : Colors.redAccent,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  /// 🚫 Max limit dialog
  void _showMaxLimitDialog() {
    Get.defaultDialog(
      title: "Limit Reached",
      middleText:
          "You can only add up to $maxQuantity quantities for this item.",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      middleTextStyle: const TextStyle(color: Colors.black87),
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(
          backgroundColor: HBColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text("OK", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
