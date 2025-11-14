import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/address_Controller.dart';
import '../../widget/address_form.dart';

class AddAddressScreen extends StatelessWidget {
  final controller = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Address")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: AddressForm(
          isEdit: false,
          onSubmit: (model) {
            controller.addAddress(model);
            Get.back();
          },
        ),
      ),
    );
  }
}
