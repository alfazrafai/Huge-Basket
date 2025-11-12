import 'package:flutter/material.dart';
import '../../../utils/constant/colors.dart';

class TitleTextWithMoreOption extends StatelessWidget {
  const TitleTextWithMoreOption({
    super.key,
    required this.titleName,
    this.moreText,
    this.onTap,
  });

  final String titleName;
  final String? moreText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 🏷 Title
          Text(titleName, style: Theme.of(context).textTheme.titleLarge),

          /// 👉 Show "More >" only if available
          if (moreText != null && onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                moreText!,
                style: TextStyle(
                  color: HBColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
