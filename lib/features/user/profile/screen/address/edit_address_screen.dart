import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huge_basket/common/widgets/HBAppBar.dart';
import '../../controller/address_Controller.dart';
import '../../widget/address_form.dart';

import '../../model/address_model.dart';

class EditAddressScreen extends StatelessWidget {
  final int index;
  final AddressModel address;

  const EditAddressScreen({
    super.key,
    required this.index,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddressController>();

    return Scaffold(
      appBar: HBAppBar(title: "Edit Address"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AddressForm(
            isEdit: true,
            initialData: address,
            onSubmit: (updated) {
              controller.updateAddress(index, updated);
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}
