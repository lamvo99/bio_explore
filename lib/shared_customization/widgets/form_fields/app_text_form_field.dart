// Flutter imports:
import 'package:bio_explore/shared_customization/data/basic_types.dart';
import 'package:bio_explore/shared_customization/enums/keyboard_type.dart';
import 'package:bio_explore/shared_customization/extensions/string_ext.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text_field.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter/services.dart';

// Project imports:
import '/app_common_data/app_colors.dart';
import '/app_common_data/common_data/global_variable.dart';

class AppTextFormField extends FormField<String> {
  final EdgeInsetsGeometry padding;
  final String? label;
  final TextEditingController? controller;
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
  final Color activeBorderColor;
  final Color defaultBorderColor;
  final EdgeInsetsGeometry contentPadding;
  final FocusNode? focusNode;
  final BorderRadius borderRadius;
  @override
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
  final bool? isRequiredField;
  final List<TextInputFormatter>? inputFormatters;

  // For FormField
  final List<TypeValidation<String>> validations;
  final void Function(FormFieldState<String>)? validationCall;

  AppTextFormField({
    super.key,
    this.padding = EdgeInsets.zero,
    this.label,
    this.controller,
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
    this.activeBorderColor = AppColors.primary600,
    this.defaultBorderColor = AppColors.gray200,
    this.contentPadding =
    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
    this.focusNode,
    this.borderRadius =
    const BorderRadius.all(Radius.circular(BORDER_RADIUS_VALUE)),
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.backgroundColor = AppColors.white,
    this.autofocus = false,
    this.onGetFirstDate,
    this.onGetLastDate,
    this.isDateAndTime = false,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    // For FormField
    required this.validations,
    this.validationCall,
    this.isRequiredField,
    this.inputFormatters,
  }) : super(
      initialValue: initValue,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (str) {

        return validations
            .map((validateFunc) => validateFunc(str))
            .firstWhere((element) => element.isNotEmptyOrNull,
            orElse: () => null);
      },
      builder: (validator) {
        validationCall?.call(validator);
        return AppTextField(
          initValue: initValue,
          label: label,
          controller: controller,
          padding: padding,
          placeholder: placeholder,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          obscureText: obscureText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          textStyle: textStyle,
          autoTrim: autoTrim,
          minLines: minLines,
          maxLines: maxLines,
          activeBorderColor: activeBorderColor,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          contentPadding: contentPadding,
          defaultBorderColor: defaultBorderColor,
          readOnly: readOnly,
          onSubmit: onSubmit,
          onTap: onTap,
          autofocus: autofocus,
          enabled: enabled,
          focusNode: focusNode,
          onChanged: (_) {
            validator.didChange(_);
            onChanged(_);
          },
          isRequiredField: isRequiredField ??
              validations
                  .map((validateFunc) => validateFunc(''))
                  .any((element) => element.isNotEmptyOrNull),
          errorLabel:
          validator.isValid == false ? validator.errorText : null,
          prefixIconConstraints: prefixIconConstraints,
          suffixIconConstraints: suffixIconConstraints,
          onGetFirstDate: onGetFirstDate,
          onGetLastDate: onGetLastDate,
          isDateAndTime: isDateAndTime,
          inputFormatters: inputFormatters,
        );
      });
}
