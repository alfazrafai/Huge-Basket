import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huge_basket/common/widgets/HBAppBar.dart';
import '../../controller/address_Controller.dart';
import '../../widget/address_form.dart';

class AddAddressScreen extends StatelessWidget {
  final controller = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HBAppBar(title: "Add New Address"),

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
