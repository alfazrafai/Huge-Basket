import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huge_basket/features/order/screen/order_screen.dart';
import 'package:huge_basket/features/user/profile/screen/ProfileOptionScreen.dart';
import 'package:iconsax/iconsax.dart';

import 'features/home/controllers/main_nav_controller.dart';
import 'features/home/screens/homeScreen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainNavController controller = Get.put(MainNavController());

    final List<Widget> screens = [
      HomeScreen(),
      OrderScreen(),
      ProfileOptionsScreen(),
    ];

    return Obx(() {
      final currentIndex = controller.selectedIndex.value;

      return WillPopScope(
        onWillPop: () async {
          // 🧭 If user is not on home tab, go back to it
          if (currentIndex != 0) {
            controller.changeTab(0);
            return false; // stop default back action
          } else {
            // ✅ Allow exit (optional confirmation)
            bool exitApp = false;
            await Get.dialog(
              AlertDialog(
                title: const Text("Exit App?"),
                content: const Text(
                  "Are you sure you want to exit Huge Basket?",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                      exitApp = false;
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      exitApp = true;
                      Get.back();
                    },
                    child: const Text("Exit"),
                  ),
                ],
              ),
            );
            return exitApp;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(index: currentIndex, children: screens),

          // ✅ Fancy Transparent Bottom Navigation Bar
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white.withOpacity(0.75),
                elevation: 0,
                currentIndex: currentIndex,
                onTap: controller.changeTab,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.black.withOpacity(0.6),
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.shop),
                    label: 'Stores',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.receipt_2),
                    label: 'My Orders',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.user),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
