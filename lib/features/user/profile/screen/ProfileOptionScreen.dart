import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/HBAppBar.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constant/colors.dart';
import '../../../home/controllers/main_nav_controller.dart';

class ProfileOptionsScreen extends StatelessWidget {
  const ProfileOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainNavController navController = Get.find<MainNavController>();

    final List<_OptionModel> options = [
      _OptionModel(Iconsax.location, "Manage Address", () {
        Get.toNamed(HBRoutes.manageAddress);
      }),
      _OptionModel(Iconsax.message, "Recent Chat", () {
        Get.toNamed('/chat');
      }),
      _OptionModel(Iconsax.notification, "Notification", () {
        Get.toNamed('/notifications');
      }),
      _OptionModel(Iconsax.star, "Rate the App", () {}),
      _OptionModel(Iconsax.share, "Share App", () {}),
      _OptionModel(Iconsax.info_circle, "Help & FAQ", () {
        Get.toNamed('/help');
      }),
      _OptionModel(Iconsax.user, "About Us", () {
        Get.toNamed('/about');
      }),
      _OptionModel(Iconsax.document_text, "Terms and Conditions", () {
        Get.toNamed('/terms');
      }),
      _OptionModel(Iconsax.lock, "Privacy Policy", () {
        Get.toNamed('/privacy');
      }),
      _OptionModel(Iconsax.call, "Contact Us", () {
        Get.toNamed('/contact');
      }),
      _OptionModel(Iconsax.logout, "Logout", () {
        _showLogoutDialog();
      }),
    ];

    return Scaffold(
      backgroundColor: HBColors.primaryGreenBackground,
      appBar: HBAppBar(
        title: "Profile Settings",
        actions: [IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit))],
        showCart: false,
        showBackButton: true,
        onBackTap: () => navController.changeTab(0), // ✅ back to home tab
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: GridView.builder(
          itemCount: options.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = options[index];
            return _buildOptionCard(item);
          },
        ),
      ),
    );
  }

  /// 🔹 Option card widget
  Widget _buildOptionCard(_OptionModel item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 28.sp, color: HBColors.primary),
            SizedBox(height: 10.h),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔒 Logout dialog confirmation
  static void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to logout?",
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      middleTextStyle: const TextStyle(color: Colors.black87),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
          Get.offAllNamed('/login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: HBColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text("Yes, Logout", style: TextStyle(color: Colors.white)),
      ),
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: const Text("Cancel"),
      ),
    );
  }
}

/// 🧩 Model for each setting option
class _OptionModel {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  _OptionModel(this.icon, this.title, this.onTap);
}
