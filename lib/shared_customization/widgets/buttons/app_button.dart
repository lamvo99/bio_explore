// Flutter imports:
import 'package:bio_explore/generated/strings.g.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import '../app_container.dart';
import '../texts/app_text.dart';
import '/app_common_data/app_colors.dart';
import '/app_common_data/app_text_sytle.dart';
import '/app_common_data/common_data/global_variable.dart';
import '/shared_customization/enums/button_type.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  ButtonType type;
  final Color? color;
  final Color? labelColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final String? label;
  final Widget? child;
  final BorderSide? borderSide;
  final BorderRadius? radius;
  final FocusNode? focusNode;
  final bool autofocus;
  final Alignment contentAlignment;

  AppButton({
    super.key,
    this.type = ButtonType.primary,
    this.color,
    this.labelColor,
    this.width,
    this.height,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.onLongPress,
    this.label,
    this.child,
    this.borderSide,
    this.radius,
    this.focusNode,
    this.autofocus = false,
    this.contentAlignment = Alignment.center,
  }) {
    if (onPressed == null) type = ButtonType.disable;
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        focusNode: focusNode,
        autofocus: autofocus,
        style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation: 0,
            padding: contentPadding,
            minimumSize: const Size(16, 40),
            alignment: contentAlignment,
            shadowColor: AppColors.transparent,
            backgroundColor: color ?? type.backgroundColor,
            foregroundColor: color ?? type.backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                    radius ?? BorderRadius.circular(BORDER_RADIUS_VALUE),
                side: borderSide ??
                    BorderSide(width: 1, color: type.borderColor))),
        child: child ??
            AppText(
              label ?? i18n.CommonAction.Confirm,
              style: AppTextStyle.textGray90014W600.copyWith(
                color: labelColor ?? type.textColor,
              ),
            ),
      ),
    );
  }
}
