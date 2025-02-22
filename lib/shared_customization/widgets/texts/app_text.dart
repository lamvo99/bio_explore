// Flutter imports:
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/shared_customization/extensions/string_ext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  String? text;
  TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool trim;
  final EdgeInsetsGeometry padding;
  final TextDecoration? decoration;

  AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
    this.trim = true,
    this.padding = EdgeInsets.zero,
    double? size,
    Color? color,
    FontWeight? fontWeight,
  }) {
    if (size != null) style = style!.copyWith(fontSize: size);
    if (color != null) style = style!.copyWith(color: color);
    if (fontWeight != null) style = style!.copyWith(fontWeight: fontWeight);
  }

  AppText.timeAgo({
    super.key,
    required DateTime dateTime,
    bool Function(DateTime dt)? dateTimeRange,
    String Function(DateTime dt)? replaceTextIfOutOfRange,
    bool isShort = false,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.overflow,
    this.maxLines,
    this.trim = true,
    this.decoration,
    this.padding = EdgeInsets.zero,
    double? size,
    Color? color,
    FontWeight? fontWeight,
  }) {
    // TimeAgo
    // TextStyle
    style ??= AppTextStyle.textGray90014W400;
    if (size != null) style = style!.copyWith(fontSize: size);
    if (color != null) style = style!.copyWith(color: color);
    if (fontWeight != null) style = style!.copyWith(fontWeight: fontWeight);
  }

  AppText.error(
    this.text, {
    super.key,
    this.style = AppTextStyle.textError50014W500,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.overflow,
    this.maxLines,
    this.decoration,
    this.trim = true,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        trim && text!.isNotEmptyOrNull ? text!.trim() : text ?? '',
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        style: style?.copyWith(decoration: decoration ?? TextDecoration.none),
        overflow:
            maxLines != null ? (overflow ?? TextOverflow.ellipsis) : overflow,
        maxLines: maxLines,
      ),
    );
  }
}
