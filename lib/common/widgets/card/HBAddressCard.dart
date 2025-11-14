import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:huge_basket/utils/constant/colors.dart';

import '../../../features/user/profile/controller/address_Controller.dart';
import '../../../features/user/profile/model/address_model.dart';
import '../../../features/user/profile/screen/address/edit_address_screen.dart';
//🔥 ADD THIS

class HBAddressCard extends StatelessWidget {
  final AddressModel address;
  final int index;
  final AddressController controller;

  const HBAddressCard({
    super.key,
    required this.address,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          /// 🔹 Address Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.selectAddress(index),
                  child: Icon(
                    address.isDefault
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: address.isDefault
                        ? HBColors.primary
                        : Colors.grey.shade400,
                    size: 22,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    address.addressLine,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(
            height: 1,
            color: Colors.grey.shade200,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
          ),

          // Action Buttons (Delete / Change)
          // Action Buttons (Delete on left / Change on right)
          Row(
            children: [
              // LEFT → DELETE
              _ActionButton(
                icon: Iconsax.trash,
                label: "Delete",
                color: Colors.red,
                textColor: Colors.black,
                onTap: () {
                  Get.defaultDialog(
                    title: "Delete Address?",
                    titleStyle: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                    middleText: "Are you sure you want to delete this address?",
                    middleTextStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
                    ),
                    radius: 12.r,
                    backgroundColor: Colors.white,

                    // Cancel Button
                    cancel: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    // Confirm Delete Button
                    confirm: ElevatedButton(
                      onPressed: () {
                        controller.deleteAddress(index);
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Delete"),
                    ),
                  );
                },
              ),

              // Divider
              Container(height: 40.h, width: 1, color: Colors.grey.shade200),

              // RIGHT → EDIT
              _ActionButton(
                icon: Iconsax.edit_2,
                label: "Change",
                color: HBColors.dark,
                textColor: Colors.black,
                onTap: () {
                  Get.to(
                    () => EditAddressScreen(index: index, address: address),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Reusable Action Button
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.only(
          bottomLeft: label == "Delete"
              ? const Radius.circular(16)
              : Radius.zero,
          bottomRight: label == "Change"
              ? const Radius.circular(16)
              : Radius.zero,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 18),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
