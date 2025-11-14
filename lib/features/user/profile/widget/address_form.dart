import 'package:flutter/material.dart';
import '../controller/address_Controller.dart';
import '../model/address_model.dart';
import 'address_text_field.dart';

class AddressForm extends StatefulWidget {
  final AddressModel? initialData;
  final Function(AddressModel model) onSubmit;
  final bool isEdit;

  const AddressForm({
    super.key,
    required this.onSubmit,
    this.initialData,
    this.isEdit = false,
  });

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController addressCtrl;
  late TextEditingController unitCtrl;
  late TextEditingController cityCtrl;
  late TextEditingController stateCtrl;
  late TextEditingController zipCtrl;
  late TextEditingController instructionCtrl;

  @override
  void initState() {
    super.initState();

    final data = widget.initialData;

    addressCtrl = TextEditingController(text: data?.address ?? "");
    unitCtrl = TextEditingController(text: data?.unit ?? "");
    cityCtrl = TextEditingController(text: data?.city ?? "");
    stateCtrl = TextEditingController(text: data?.state ?? "");
    zipCtrl = TextEditingController(text: data?.zip ?? "");
    instructionCtrl = TextEditingController(text: data?.instructions ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Column(
        children: [
          AddressTextField(label: "Address", controller: addressCtrl),
          AddressTextField(label: "Unit Number", controller: unitCtrl),
          AddressTextField(label: "City", controller: cityCtrl),
          AddressTextField(label: "State", controller: stateCtrl),
          AddressTextField(label: "Zipcode", controller: zipCtrl),
          AddressTextField(
            label: "Delivery Instructions",
            controller: instructionCtrl,
            maxLines: 4,
            requiredField: false,
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size(double.infinity, 50),
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit(
                  AddressModel(
                    address: addressCtrl.text,
                    unit: unitCtrl.text,
                    city: cityCtrl.text,
                    state: stateCtrl.text,
                    zip: zipCtrl.text,
                    instructions: instructionCtrl.text,
                    isDefault: widget.initialData?.isDefault ?? false,
                  ),
                );
              }
            },
            child: Text(widget.isEdit ? "Update" : "Add"),
          ),
        ],
      ),
    );
  }
}
