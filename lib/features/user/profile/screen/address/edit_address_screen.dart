import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/address_Controller.dart';
import '../../model/address_model.dart';

class EditAddressScreen extends StatefulWidget {
  final int index;
  final AddressModel address;

  const EditAddressScreen({
    Key? key,
    required this.index,
    required this.address,
  }) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final controller = Get.find<AddressController>();

  late final TextEditingController addressCtrl;
  late final TextEditingController unitCtrl;
  late final TextEditingController cityCtrl;
  late final TextEditingController stateCtrl;
  late final TextEditingController zipCtrl;
  late final TextEditingController instructionCtrl;

  @override
  void initState() {
    super.initState();
    addressCtrl = TextEditingController(text: widget.address.address);
    unitCtrl = TextEditingController(text: widget.address.unit);
    cityCtrl = TextEditingController(text: widget.address.city);
    stateCtrl = TextEditingController(text: widget.address.state);
    zipCtrl = TextEditingController(text: widget.address.zip);
    instructionCtrl = TextEditingController(text: widget.address.instructions);
  }

  @override
  void dispose() {
    addressCtrl.dispose();
    unitCtrl.dispose();
    cityCtrl.dispose();
    stateCtrl.dispose();
    zipCtrl.dispose();
    instructionCtrl.dispose();
    super.dispose();
  }

  Widget buildField(
    String hint,
    TextEditingController ctrl, {
    int maxLines = 1,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: ctrl,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Address")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildField("Address", addressCtrl),
            buildField("Unit Number", unitCtrl),
            buildField("City", cityCtrl),
            buildField("State", stateCtrl),
            buildField("Zipcode", zipCtrl),
            buildField("Delivery Instructions", instructionCtrl, maxLines: 5),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                controller.updateAddress(
                  widget.index,
                  AddressModel(
                    address: addressCtrl.text,
                    unit: unitCtrl.text,
                    city: cityCtrl.text,
                    state: stateCtrl.text,
                    zip: zipCtrl.text,
                    instructions: instructionCtrl.text,
                    isDefault: widget.address.isDefault,
                  ),
                );
                Get.back();
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
