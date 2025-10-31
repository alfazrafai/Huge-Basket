import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import 'package:iconsax/iconsax.dart';

class HBAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color backgroundColor;

  const HBAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor = HBColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 10,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.1),
        leading: showBackButton
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left_2, color: Colors.black),
              )
            : null,
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: HBColors.primary),
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}
