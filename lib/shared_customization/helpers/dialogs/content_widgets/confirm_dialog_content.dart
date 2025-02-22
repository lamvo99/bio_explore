// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:

// Project imports:
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/texts/app_text.dart';
import '/shared_customization/enums/button_type.dart';
import '/shared_customization/helpers/dialogs/content_widgets/base_dialog_content.dart';

class ConfirmDialogContent extends BaseDialogContent {
  final String? title;
  final String? content;
  final String? acceptLable;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  ConfirmDialogContent({
    super.key,
    this.title,
    this.content,
    this.onAccept,
    this.acceptLable,
    this.onReject,
  }) : super(builder: (context) {
          return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppText(
                          title ?? i18n.CommonAction.Confirm,
                          style: AppTextStyle.textGray90016W600
                              .copyWith(color: AppColors.gray800),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
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
                const SizedBox(height: 8),
                AppText(
                  content ?? "",
                  style: AppTextStyle.textGray90014W600.copyWith(color: AppColors.gray600),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppButton(
                        type: ButtonType.white,
                        label: i18n.CommonAction.Cancel,
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          onReject?.call();
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: AppButton(
                        label: acceptLable ?? i18n.CommonAction.Confirm,
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          onAccept?.call();
                        },
                      ),
                    ),
                  ],
                ),
              ]);
        });
}
