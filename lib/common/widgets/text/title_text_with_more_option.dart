import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';

class TitleTextWithMoreOption extends StatelessWidget {
  const TitleTextWithMoreOption({
    super.key,
    required this.titleName,
    this.moreText = 'More >',
  });

  final String titleName;
  final String? moreText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleName, style: Theme.of(context).textTheme.titleLarge),
        Text(
          moreText!,
          style: TextStyle(
            color: HBColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
