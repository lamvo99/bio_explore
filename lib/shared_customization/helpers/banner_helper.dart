// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/app_common_data/common_data/global_variable.dart';
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';

// Project imports:
import '../widgets/app_container.dart';
import '../widgets/texts/app_text.dart';

enum BannerType { success, error, warning, info }

enum BannerPosition { top, bottom }

extension BannerExt on BannerType {
  Color get backgroundColor => {
        BannerType.success: AppColors.bgSuccess,
        BannerType.error: AppColors.bgError,
        BannerType.warning: AppColors.bgWarning,
        BannerType.info: AppColors.bgInfo,
      }[this]!;

  SvgGenImage get icon => {
        BannerType.success: Assets.icons.icSuccessBanner,
        BannerType.error: Assets.icons.icErrorBanner,
        BannerType.info: Assets.icons.icConfirmFlag,
        BannerType.warning: Assets.icons.icConfirmFlag,
      }[this]!;

  Color get borderColor => {
        BannerType.success: AppColors.success600,
        BannerType.error: AppColors.error600,
        BannerType.info: Colors.blue[800],
        BannerType.warning: Colors.yellow[800],
      }[this]!;

  Color get textColor => {
        BannerType.success: AppColors.gray800,
        BannerType.error: AppColors.gray800,
        BannerType.warning: AppColors.gray800,
        BannerType.info: AppColors.gray800,
      }[this]!;
}

extension BannerPositionExt on BannerPosition {
  Alignment get align => {
        BannerPosition.bottom: Alignment.bottomCenter,
        BannerPosition.top: Alignment.topCenter,
      }[this]!;
}

void showErrorBanner({
  required String content,
  int delayDurationInMilliseconds = 0,
  int durationInMilliseconds = 2000,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: BannerType.error,
      );
    },
    align: BannerPosition.top.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: Duration(milliseconds: durationInMilliseconds),
  );
}

void showSuccessBanner({
  required String content,
  int delayDurationInMilliseconds = 0,
  int durationInMilliseconds = 2000,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: BannerType.success,
      );
    },
    align: BannerPosition.top.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: Duration(milliseconds: durationInMilliseconds),
  );
}

void showWarningBanner({
  required String content,
  int delayDurationInMilliseconds = 0,
  int durationInMilliseconds = 2000,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: BannerType.warning,
      );
    },
    align: BannerPosition.top.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: Duration(milliseconds: durationInMilliseconds),
  );
}

void showInfoBanner({
  required String content,
  int delayDurationInMilliseconds = 0,
  int durationInMilliseconds = 2000,
  Widget? child,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: BannerType.info,
        child: child,
      );
    },
    align: BannerPosition.top.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: Duration(milliseconds: durationInMilliseconds),
  );
}

void showBottomBanner({
  required String content,
  BannerType bannerType = BannerType.info,
  BannerPosition bannerPosition = BannerPosition.bottom,
  int delayDurationInMilliseconds = 0,
  int durationInMilliseconds = 2000,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return CustomBanner(
        content: content,
        bannerType: bannerType,
      );
    },
    align: bannerPosition.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: Duration(milliseconds: durationInMilliseconds),
  );
}

void showCustomBanner({
  required Widget widget,
  BannerPosition bannerPosition = BannerPosition.top,
  int delayDurationInMilliseconds = 0,
  int durationInMilliseconds = 2000,
  VoidCallback? onTap,
}) async {
  if (delayDurationInMilliseconds > 0) {
    await Future.delayed(Duration(milliseconds: delayDurationInMilliseconds));
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) => Material(
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
            onTap: () {
              cancelFunc();
              onTap?.call();
            },
            child: CustomBanner(
                child: widget,
                onClose: () {
                  cancelFunc();
                  onTap?.call();
                }))),
    align: bannerPosition.align,
    backButtonBehavior: BackButtonBehavior.ignore,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 300),
    duration: Duration(milliseconds: durationInMilliseconds),
  );
}

class CustomBanner extends StatelessWidget {
  const CustomBanner(
      {super.key, this.content, this.bannerType, this.child, this.onClose});
  final String? content;
  final BannerType? bannerType;
  final Widget? child;
  final Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppColors.white,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(16, 24, 40, 0.10),
          offset: Offset(0, 4),
          blurRadius: 8,
          spreadRadius: -2,
        ),
        BoxShadow(
          color: Color.fromRGBO(16, 24, 40, 0.06),
          offset: Offset(0, 2),
          blurRadius: 4,
          spreadRadius: -2,
        ),
      ],
      border: Border.all(
          color: bannerType?.borderColor ?? AppColors.white, width: 1),
      child: child ??
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bannerType?.icon.svg(
                    width: 38,
                  ) ??
                  EMPTY_WIDGET,
              const SizedBox(width: 8),
              Expanded(
                child: AppText(
                  content,
                  style: AppTextStyle.textGray90014W600,
                ),
              ),
              if (onClose != null) ...[
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                    onTap: () {
                      if (onClose != null) {
                        onClose!();
                      }
                    },
                    child: Assets.icons.icClose.svg())
              ]
            ],
          ),
    );
  }
}
