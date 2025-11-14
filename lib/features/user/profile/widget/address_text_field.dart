import 'package:flutter/material.dart';
import 'package:huge_basket/utils/constant/colors.dart';

class AddressTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;
  final bool requiredField;

  const AddressTextField({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
    this.requiredField = true,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      // REMOVE ALL DEFAULT TEXTFIELD BORDERS
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: TextFormField(
          controller: controller,
          maxLines: maxLines,

          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(color: HBColors.hintText, fontSize: 14),
            // Even though we set this, Theme override ensures no border
            border: InputBorder.none,
          ),

          validator: (value) {
            if (requiredField && (value == null || value.trim().isEmpty)) {
              return "$label is required";
            }
            if (label == "Zipcode" && value!.length < 4) {
              return "Enter a valid ZIP code";
            }
            return null;
          },
        ),
      ),
    );
  }
}
