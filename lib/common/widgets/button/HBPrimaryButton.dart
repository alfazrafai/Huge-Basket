import 'dart:ui';

import 'package:flutter/material.dart';

class HBPrimaryButton extends StatelessWidget {
  const HBPrimaryButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onTap,
        child: Text(buttonText),
      ),
    );
  }
}
