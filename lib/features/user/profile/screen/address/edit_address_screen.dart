import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(title: const Text("Edit Address")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: AddressForm(
          isEdit: true,
          initialData: address,
          onSubmit: (updated) {
            controller.updateAddress(index, updated);
            Get.back();
          },
        ),
      ),
    );
  }
}
