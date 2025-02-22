// Flutter imports:
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../app_common_data/app_text_sytle.dart';
import '/app_common_data/app_colors.dart';
import 'custom_widgets/app_field.dart';
import 'texts/app_text.dart';

class DropdownSearchItemModel<T> {
  final T? value;
  final bool enable;
  final String label;
  final Widget? child;

  DropdownSearchItemModel({
    required this.value,
    required this.label,
    this.enable = true,
    this.child,
  });
}

class AppDropdownSearchButton<T> extends StatefulWidget {
  final ValueChanged<T?>? onChanged;
  final T? value;
  final List<DropdownSearchItemModel<T>> items;
  final String? label;
  final String? errorLabel;
  final Widget? placeholder;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? icon;
  final bool? isExpanded;
  final double radius;
  final bool isRequired;
  final Color? borderColor;
  final double? placeholderSize;
  final Color? backgroundColor;
  final bool Function(DropdownMenuItem<T>, String)? searchMatchFn;
  final double heightButton;

  const AppDropdownSearchButton({
    super.key,
    required this.onChanged,
    required this.value,
    required this.items,
    this.label,
    this.errorLabel,
    this.placeholder,
    this.padding,
    this.margin,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.icon,
    this.isExpanded = true,
    this.radius = 6,
    this.isRequired = true,
    this.borderColor,
    this.placeholderSize = 14,
    this.backgroundColor = AppColors.white,
    required this.searchMatchFn,
    this.heightButton = 54,
  });

  @override
  State<AppDropdownSearchButton<T>> createState() =>
      _AppDropdownSearchButtonState<T>();
}

class _AppDropdownSearchButtonState<T>
    extends State<AppDropdownSearchButton<T>> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      color: AppColors.transparent,
      child: AppField(
        errorLabel: widget.errorLabel,
        label: widget.label,
        isRequired: widget.isRequired,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            value: widget.value,
            isDense: true,
            isExpanded: true,
            style: AppTextStyle.textGray80012W600,
            underline: Container(),
            hint: widget.placeholder,
            onChanged: widget.onChanged,
            items: widget.items.map((item) {
              return DropdownMenuItem<T>(
                enabled: item.enable,
                value: item.value,
                child: item.child ??
                    AppText(
                      item.label,
                      color:
                          item.enable ? AppColors.black : AppColors.basicGrey,
                    ),
              );
            }).toList(),
            iconStyleData: IconStyleData(icon: Assets.icons.icArrowBottom.svg()),
            buttonStyleData: _buttonStyleData(),
            dropdownStyleData: _dropdownStyleData(),
            menuItemStyleData: _menuItemStyleData(),
            dropdownSearchData: _dropdownSearchData(_controller),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                _controller.clear();
              }
            },
          ),
        ),
      ),
    );
  }

  ButtonStyleData _buttonStyleData() {
    return ButtonStyleData(
      height: widget.heightButton,
      padding: widget.contentPadding ?? EdgeInsets.zero,
      width: 1.sw,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(
            color: widget.errorLabel != null
                ? AppColors.red
                : (widget.borderColor != null)
                    ? widget.borderColor!
                    : AppColors.gray200,
            width: 1),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
    );
  }

  DropdownSearchData<T> _dropdownSearchData(TextEditingController controller) {
    return DropdownSearchData(
      searchController: controller,
      searchInnerWidgetHeight: 50,
      searchInnerWidget: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: TextFormField(
          expands: true,
          maxLines: null,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.primary600, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.gray300,
              ),
            ),
          ),
        ),
      ),
      searchMatchFn: widget.searchMatchFn,
    );
  }

  DropdownStyleData _dropdownStyleData() {
    return DropdownStyleData(
      maxHeight: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }

  MenuItemStyleData _menuItemStyleData() {
    return const MenuItemStyleData(
      height: 50,
    );
  }
}
