import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../features/cart/controller/CartController.dart';
import '../../features/home/controllers/main_nav_controller.dart';

class HBAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final bool showCart;
  final VoidCallback? onCartTap;
  final VoidCallback? onBackTap; // ✅ added manual back option

  const HBAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor = HBColors.white,
    this.titleColor,
    this.iconColor,
    this.showCart = false,
    this.onCartTap,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final Color resolvedTitleColor = titleColor ?? HBColors.primary;
    final Color resolvedIconColor = iconColor ?? HBColors.black;

    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 10,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black.withOpacity(0.1),

      /// 🔹 Smart Back Button Logic
      leading: showBackButton
          ? IconButton(
              icon: Icon(Iconsax.arrow_left_2, color: resolvedIconColor),
              onPressed:
                  onBackTap ??
                  () {
                    // 🧠 Smart Back Behavior
                    if (Get.isRegistered<MainNavController>()) {
                      final nav = Get.find<MainNavController>();
                      if (nav.selectedIndex.value != 0) {
                        nav.changeTab(0); // go to Home tab
                        return;
                      }
                    }
                    Get.back(); // fallback: normal back
                  },
            )
          : null,

      /// 🏷️ Title
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: resolvedTitleColor,
          fontWeight: FontWeight.w700,
        ),
      ),

      /// ⚙️ Actions + Cart
      actions: [
        if (actions != null) ...actions!,
        if (showCart)
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: Icon(
                    Iconsax.shopping_cart,
                    color: resolvedIconColor,
                    size: 24,
                  ),
                  onPressed: onCartTap ?? () => Get.toNamed('/cart'),
                ),
                // 🧩 Cart Badge
                Positioned(
                  right: 2,
                  top: 5,
                  child: Obx(() {
                    final count = cartController.cartItems.length;
                    if (count <= 0) return const SizedBox.shrink();
                    return AnimatedScale(
                      duration: const Duration(milliseconds: 250),
                      scale: 1.1,
                      curve: Curves.easeOutBack,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: HBColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: HBColors.primary.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(1, 2),
                            ),
                          ],
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Center(
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20.h);
}
