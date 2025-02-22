// ignore_for_file: deprecated_member_use_from_same_package, invalid_use_of_protected_member

// Flutter imports:
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/shared_customization/enums/keyboard_type.dart';
import 'package:bio_explore/shared_customization/extensions/string_ext.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/custom_widgets/app_field.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:

// Project imports:
import '/app_common_data/app_colors.dart';
import '/app_common_data/app_text_sytle.dart';
import '/app_common_data/common_data/global_variable.dart';

class AppTextField extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final String? label;
  final TextEditingController? controller;
  final String? errorLabel;
  final String? placeholder;
  final ValueChanged<String> onChanged;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmit;
  final String? initValue;
  final KeyboardType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final bool autoTrim;
  final int? minLines;
  final int? maxLines;
  final bool isRequiredField;
  final Color activeBorderColor;
  final Color defaultBorderColor;
  final EdgeInsetsGeometry contentPadding;
  final FocusNode? focusNode;
  final BorderRadius borderRadius;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool autofocus;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final DateTime Function()? onGetFirstDate;
  final DateTime Function()? onGetLastDate;
  final bool isDateAndTime;
  final List<String>? badWords;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    //
    this.padding = EdgeInsets.zero,
    this.label,
    this.controller,
    this.errorLabel,
    this.placeholder,
    required this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onSubmit,
    this.initValue,
    this.keyboardType = KeyboardType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.autoTrim = true,
    this.minLines,
    this.maxLines,
    this.isRequiredField = true,
    this.activeBorderColor = AppColors.primary500,
    this.defaultBorderColor = AppColors.gray200,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
    this.focusNode,
    this.borderRadius =
        const BorderRadius.all(Radius.circular(BORDER_RADIUS_VALUE)),
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.backgroundColor = AppColors.white,
    this.autofocus = false,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.onGetFirstDate,
    this.onGetLastDate,
    this.isDateAndTime = false,
    this.badWords,
    this.inputFormatters,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController controller;
  late bool obscureText = widget.obscureText;
  Widget? suffixIconByKeyboardType;
  OutlineInputBorder? border;
  bool isDefaultSuffixIcon = false;
  bool isShowClearButton = false;

  @override
  void initState() {
    // Init controller

      controller = widget.controller ?? TextEditingController();


    if (widget.initValue!.isNotEmptyOrNull) {
      controller.value = TextEditingValue(text: widget.initValue!);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.onChanged(widget.initValue!);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Init border
    border = OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: widget.defaultBorderColor),
        borderRadius: widget.borderRadius);

    // Init suffixIconByKeyboardType
    suffixIconByKeyboardType = _buildSuffixIconByKeyboardType();
    if (isDefaultSuffixIcon && !controller.hasListeners) {
      controller.addListener(() {
        if (isShowClearButton != controller.text.isNotEmptyOrNull) {
          setState(() {
            isShowClearButton = controller.text.isNotEmptyOrNull;
          });
        }
      });
    }
    return Padding(
      padding: widget.padding,
      child: AppField(
        errorLabel: widget.errorLabel,
        label: widget.label,
        isRequired: widget.isRequiredField,
        child: AppContainer(
          color: widget.enabled
              ? (widget.backgroundColor ?? AppColors.transparent)
              : AppColors.transparent,
          borderRadius: widget.borderRadius,
          child: TextField(
            autofocus: widget.autofocus,
            showCursor: !widget.readOnly,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            cursorColor: AppColors.primary600,
            controller: controller,
            style: widget.textStyle ?? AppTextStyle.textGray90014W400,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              errorText: widget.errorLabel.isNotEmptyOrNull ? '' : null,
              errorMaxLines: 1,
              errorStyle: const TextStyle(height: 1, fontSize: 0),
              isDense: true,
              hintStyle: (widget.textStyle ?? AppTextStyle.textGray90014W400).copyWith(color: AppColors.gray400),
              hintText: widget.placeholder ??
                  i18n.Placeholder.InputFieldPlaceholder(fieldName: widget.label?.toLowerCase() ?? ''),
              contentPadding: widget.contentPadding,
              border: border!.copyWith(
                  borderRadius: widget.borderRadius,
                  borderSide: border!.borderSide.copyWith(
                      color: widget.errorLabel.isNotEmptyOrNull
                          ? AppColors.error400
                          : border!.borderSide.color)),
              enabledBorder:
                  border!.copyWith(borderRadius: widget.borderRadius),
              errorBorder: border!.copyWith(
                  borderRadius: widget.borderRadius,
                  borderSide:
                      border!.borderSide.copyWith(color: AppColors.error400)),
              focusedErrorBorder: border!.copyWith(
                  borderRadius: widget.borderRadius,
                  borderSide:
                      border!.borderSide.copyWith(color: AppColors.error400)),
              focusedBorder: border!.copyWith(
                  borderRadius: widget.borderRadius,
                  borderSide: widget.readOnly
                      ? border!.borderSide
                      : border!.borderSide
                          .copyWith(color: widget.activeBorderColor)),
              prefixIcon: widget.prefixIcon != null
                  ? Align(alignment: Alignment.center, child: widget.prefixIcon)
                  : null,
              suffixIcon: Builder(builder: (context) {
                if (widget.suffixIcon != null) {
                  return Align(
                      alignment: Alignment.center, child: widget.suffixIcon);
                }
                if (suffixIconByKeyboardType != null && !isDefaultSuffixIcon) {
                  return suffixIconByKeyboardType!;
                }
                if (widget.obscureText) {
                  return InkWell(
                    onTap: () => setState(() => obscureText = !obscureText),
                    child: Align(
                        alignment: Alignment.center,
                        child: obscureText
                            ? Assets.icons.icEye.svg(width: 22, height: 22)
                            : Assets.icons.icEyeOff
                                .svg(width: 22, height: 22)),
                  );
                }
                return isShowClearButton
                    ? suffixIconByKeyboardType!
                    : EMPTY_WIDGET;
              }),
              prefixIconConstraints: widget.prefixIconConstraints ??
                  const BoxConstraints(maxHeight: 42, maxWidth: 56),
              suffixIconConstraints: widget.suffixIconConstraints ??
                  const BoxConstraints(maxHeight: 42, maxWidth: 56),
            ),
            onChanged: (value) {
              widget.autoTrim
                  ? widget.onChanged.call(value.trim())
                  : widget.onChanged(value);
            },
            textInputAction: widget.textInputAction,
            onSubmitted: widget.onSubmit ??
                (widget.keyboardType == KeyboardType.visiblePassword &&
                        widget.textInputAction == TextInputAction.newline
                    ? (_) {
                        FocusScope.of(context).nextFocus();
                      }
                    : null),
            keyboardType: widget.keyboardType.inputType,
            obscureText: obscureText,
            obscuringCharacter: "•",
            minLines: widget.minLines,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            inputFormatters: [
              ...widget.inputFormatters ?? [],

              ///
              /// phone number
              ///
              if (widget.keyboardType == KeyboardType.phone)
                // FilteringTextInputFormatter.allow(RegExp(r'[0-9*#+() .-]+')),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+() .-]+')),

              ///
              /// int number
              ///
              if (widget.keyboardType == KeyboardType.int) ...[
                LengthLimitingTextInputFormatter(19),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
              ],

              ///
              /// double number
              ///
              if (widget.keyboardType == KeyboardType.double)
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]+')),

              ///
              /// money number
              ///
              if (widget.keyboardType == KeyboardType.money) ...[
                LengthLimitingTextInputFormatter(19),
                NoDecimalFormatter(),
              ],

              ///
              /// code voucher
              ///
              if (widget.keyboardType == KeyboardType.codeVoucher) ...[
                UpperCaseTextFormatter(),
                LengthLimitingTextInputFormatter(8),
              ],

              ///
              /// code voucher
              ///
              if (widget.keyboardType == KeyboardType.codeBranch) ...[
                // LowerCaseTextFormatter(),
                // LengthLimitingTextInputFormatter(32),
              ],

              if (widget.keyboardType == KeyboardType.int) ...[
                LengthLimitingTextInputFormatter(19),
              ]
            ],
            focusNode: widget.focusNode,
            enabled: widget.enabled,
          ),
        ),
      ),
    );
  }

  Widget _buildSuffixIcon({VoidCallback? onTap, required Widget child}) =>
      GestureDetector(
          onTap: onTap,
          child: Align(alignment: Alignment.center, child: child));

  Widget? _buildSuffixIconByKeyboardType() {
    switch (widget.keyboardType) {
      case KeyboardType.datetime:
        return _buildSuffixIcon(
            onTap: () async {
              final currentLocale = Localizations.localeOf(context);
              DateTime? initialDate;
              DateTime lastDate =
                  widget.onGetLastDate?.call() ?? DateTime.now();
              DateTime firstDate =
                  widget.onGetFirstDate?.call() ?? DateTime(1900);
              try {
                // if (Validators.validateDateTimeFormat(controller.text)
                //     .isEmptyOrNull) {
                //   initialDate =
                //       controller.text.toDateTime(locale: currentLocale) ??
                //           DateTime.now();
                // } else {
                //   initialDate = DateTime.now();
                // }
              } catch (err) {
                initialDate = DateTime.now();
              }
              // showCalendarPicker(
              //   context,
              //   initDateTime: initialDate,
              //   minDate: firstDate,
              //   lastDate: lastDate,
              //   onChanged: (DateTime value) async {
              //     if (!widget.isDateAndTime) {
              //       widget
              //           .onChanged(value.toDayMonthYear(locale: currentLocale));
              //       controller.text =
              //           value.toDayMonthYear(locale: currentLocale);
              //     } else {
              //       final TimeOfDay? selectedTime = await showTimePicker(
              //         context: context,
              //         initialTime: TimeOfDay.fromDateTime(value),
              //       );
              //       if (selectedTime == null) {
              //         widget.onChanged(
              //             value.toDayMonthYear(locale: currentLocale));
              //         controller.text =
              //             value.toDayMonthYear(locale: currentLocale);
              //       } else {
              //         DateTime dateAndTime = DateTime(
              //           value.year,
              //           value.month,
              //           value.day,
              //           selectedTime.hour,
              //           selectedTime.minute,
              //         );
              //
              //         widget.onChanged(dateAndTime.toDayMonthYearAndTime(
              //             locale: currentLocale));
              //         controller.text = dateAndTime.toDayMonthYearAndTime(
              //             locale: currentLocale);
              //       }
              //     }
              //   },
              // );
            },
            child: const Icon(Icons.calendar_month_rounded,
                size: 24, color: AppColors.primary600));
      case KeyboardType.phone:
        return _buildSuffixIcon(
            child: const Icon(Icons.phone_enabled_rounded,
                size: 22, color: AppColors.primary600));
      case KeyboardType.money:
        return _buildSuffixIcon(
            child: AppText("CURRENCY",
                color: AppColors.primary600, fontWeight: FontWeight.w600));
      case KeyboardType.percent:
        return _buildSuffixIcon(
            child: AppText("%",
                color: AppColors.primary600, fontWeight: FontWeight.w600));
      default:
        if (!obscureText && !widget.readOnly) {
          isDefaultSuffixIcon = true;
          return _buildSuffixIcon(
              onTap: () {
                controller.clear();
                widget.onChanged('');
              },
              child: const Icon(Icons.cancel_rounded,
                  size: 22, color: AppColors.primary600));
        }
    }

    return null;
  }
}
