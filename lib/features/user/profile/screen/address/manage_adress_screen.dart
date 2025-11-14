import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huge_basket/common/widgets/HBAppBar.dart';
import 'package:huge_basket/utils/constant/colors.dart';
import '../../../../../common/widgets/card/HBAddressCard.dart';
import '../../controller/address_Controller.dart';
import 'add_address_screen.dart';

class ManageAddressScreen extends StatelessWidget {
  ManageAddressScreen({super.key});

  final AddressController controller = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HBColors.primaryGreenBackground,
      appBar: HBAppBar(
        title: "Manage Address",
        backgroundColor: Colors.white,
        titleColor: HBColors.primary,
        iconColor: HBColors.black,
        showBackButton: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Obx(
          () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.addresses.length + 1,
            itemBuilder: (context, index) {
              // Address Cards
              if (index < controller.addresses.length) {
                final address = controller.addresses[index];
                return HBAddressCard(
                  address: address,
                  index: index,
                  controller: controller,
                );
              }

              // Add New Button
              return Padding(
                padding: EdgeInsets.only(top: 4.h, bottom: 16.h),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AddAddressScreen());
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: HBColors.primary,
                          size: 22,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "Add New",
                          style: TextStyle(
                            color: HBColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
