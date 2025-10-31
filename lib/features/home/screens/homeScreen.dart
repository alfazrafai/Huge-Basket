import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:huge_basket/features/authentication/screens/login/login_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stores = [
      {
        "name": "Walmart",
        "category": "Grocery",
        "distance": "1 mile",
        "address": "3456 Washington Street, Us, 4568",
        "image":
            "https://images.squarespace-cdn.com/content/v1/5d07a4816460ff000144d4b5/1605052887151-KXNVRJJNA6KEZTH42727/Handmag-Product-Photography-by-Jinnifer-Douglass-001.jpg",
      },
      {
        "name": "Stop & Shop",
        "category": "Grocery and General",
        "distance": "2 mile",
        "address": "3456 Washington Street, Us, 4568",
        "image":
            "https://images.squarespace-cdn.com/content/v1/5d07a4816460ff000144d4b5/1605052887151-KXNVRJJNA6KEZTH42727/Handmag-Product-Photography-by-Jinnifer-Douglass-001.jpg",
      },
      {
        "name": "Safeway",
        "category": "Grocery",
        "distance": "3.5 mile",
        "address": "3456 Washington Street, Us, 4568",
        "image": "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
      },
      {
        "name": "Giant Food Stores",
        "category": "Grocery",
        "distance": "4 mile",
        "address": "3456 Washington Street, Us, 4568",
        "image": "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
      },
      {
        "name": "Meijer",
        "category": "Grocery",
        "distance": "4 mile",
        "address": "3456 Washington Street, Us, 4568",
        "image": "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
      },
      {
        "name": "Meijer",
        "category": "Grocery",
        "distance": "4 mile",
        "address": "3456 Washington Street, Us, 4568",
        "image": "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
      },
      {
        "name": "Meijer",
        "category": "Grocery",
        "distance": "4 mile",
        "address": "3456 Washington Street, Us, 4568",
        "image": "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
      },
      {
        "name": "Meijer",
        "category": "Grocery",
        "distance": "4 mile",
        "address": "3456 Washington Street, Us, 4568",
        "image": "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Huge Basket",
          style: TextStyle(
            color: Colors.green,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Stack(
          children: [
            IconButton(
              onPressed: () => Get.to(() => const LoginScreen()),
              icon: const Icon(Iconsax.notification),
              color: HBColors.dark,
            ),
            Positioned(
              right: 15,
              top: 8,

              child: Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HBColors.primary,
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.shopping_bag, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Delivery Info Banner
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: BoxDecoration(color: Colors.green.withOpacity(0.1)),
            child: const Text(
              "Next delivery on Wed, 14 Nov 2020",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Store List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  final store = stores[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                store['image']!,
                                height: 70.h,
                                width: 70.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: -1,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      store['name']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    store['distance']!,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                store['category']!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                store['address']!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.shop), label: 'Stores'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.receipt_2),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
    );
  }
}
