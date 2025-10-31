import 'package:flutter/material.dart';

class TextButtonWithUnderLine extends StatelessWidget {
  const TextButtonWithUnderLine({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          decoration: TextDecoration.underline,

          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
