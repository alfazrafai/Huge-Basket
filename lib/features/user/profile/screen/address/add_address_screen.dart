import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:huge_basket/common/widgets/HBAppBar.dart';

import '../../controller/address_Controller.dart';
import '../../model/address_model.dart';

class AddAddressScreen extends StatelessWidget {
  final controller = Get.find<AddressController>();

  final addressCtrl = TextEditingController();
  final unitCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final stateCtrl = TextEditingController();
  final zipCtrl = TextEditingController();
  final instructionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HBAppBar(title: "Add new address"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            buildField("Address", addressCtrl),
            buildField("Unit Number", unitCtrl),
            buildField("City", cityCtrl),
            buildField("State", stateCtrl),
            buildField("Zipcode", zipCtrl),
            buildField("Delivery Instructions", instructionCtrl, maxLines: 5),

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: StadiumBorder(),
              ),
              onPressed: () {
                controller.addAddress(
                  AddressModel(
                    address: addressCtrl.text,
                    unit: unitCtrl.text,
                    city: cityCtrl.text,
                    state: stateCtrl.text,
                    zip: zipCtrl.text,
                    instructions: instructionCtrl.text,
                  ),
                );
                Get.back();
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(
    String label,
    TextEditingController ctrl, {
    int maxLines = 1,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: ctrl,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
