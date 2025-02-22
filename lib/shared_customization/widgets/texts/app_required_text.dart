// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '/app_common_data/app_colors.dart';
import '/app_common_data/app_text_sytle.dart';

class AppRequiredText extends StatelessWidget {
  final String label;
  final Color textColor;
  final bool isRequired;
  final EdgeInsetsGeometry padding;
  const AppRequiredText(
    this.label, {
    super.key,
    required this.isRequired,
    this.padding = EdgeInsets.zero,
    this.textColor = AppColors.gray700,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: label,
          style: AppTextStyle.textGray90014W500.copyWith(color: textColor),
        ),
        if (isRequired)
          TextSpan(
              text: " *",
              style: AppTextStyle.textGray90014W500.copyWith(
                color: AppColors.red,
                fontWeight: FontWeight.w500,
              ))
      ])),
    );
  }
}
