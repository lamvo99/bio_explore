// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/shared_customization/widgets/buttons/app_button.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_dialog_content.dart';

// Package imports:

// Project imports:

class ErrorDialogContent extends BaseDialogContent {
  final String? title;
  final String? content;
  final VoidCallback? onAccept;

  ErrorDialogContent({
    super.key,
    this.title,
    this.content,
    this.onAccept,
  }) : super(builder: (context) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppText(
                          title ?? i18n.CommonData.Error,
                          style: AppTextStyle.textGray90018W600
                              .copyWith(color: AppColors.error600),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Assets.icons.icClose.svg(
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                              AppColors.gray400, BlendMode.srcIn),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                AppText(
                  content ?? i18n.CommonData.HasErrorOccurr,
                  style: AppTextStyle.textGray90014W400.copyWith(color: AppColors.gray600),
                ),
                const SizedBox(height: 40),
                AppButton(
                  label: i18n.CommonAction.Ok,
                  width: 1.sw,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    onAccept?.call();
                  },
                ),
              ]);
        });
}
