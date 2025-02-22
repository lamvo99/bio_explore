// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:readmore/readmore.dart';

// Project imports:

class AppReadmoreText extends StatelessWidget {
  final String text;
  final int trimLines;
  final TrimMode trimMode;
  const AppReadmoreText(
      {super.key,
      required this.text,
      this.trimLines = 2,
      this.trimMode = TrimMode.Line});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimMode: trimMode,
      trimLines: trimLines,
      style: AppTextStyle.textGray90014W400,
      colorClickableText: AppColors.primary600,
      trimCollapsedText: "  ${i18n.CommonAction.ShowMore}",
      trimExpandedText: i18n.CommonAction.ShowLess,
      moreStyle:
          AppTextStyle.textGray90014W500.copyWith(color: AppColors.primary600),
      lessStyle:
          AppTextStyle.textGray90014W500.copyWith(color: AppColors.primary600),
    );
  }
}
