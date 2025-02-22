// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '/app_common_data/app_colors.dart';

enum ButtonType { primary, white, red, disable }

extension ButtonTypeExt on ButtonType {
  Color get backgroundColor => {
        ButtonType.primary: AppColors.primary500,
        ButtonType.white: AppColors.white,
        ButtonType.disable: AppColors.gray100,
        ButtonType.red: AppColors.error500,
      }[this]!;

  Color get textColor => {
        ButtonType.primary: AppColors.white,
        ButtonType.white: AppColors.gray800,
        ButtonType.disable: AppColors.gray400,
        ButtonType.red: AppColors.white,
      }[this]!;

  Color get borderColor => {
        ButtonType.primary: AppColors.transparent,
        ButtonType.white: AppColors.gray300,
        ButtonType.disable: AppColors.gray100,
        ButtonType.red: AppColors.transparent,
      }[this]!;

  List<double> get stops => {
        ButtonType.primary: [0.0, 1.0],
        ButtonType.white: [0.0, 1.0],
        ButtonType.disable: [0.0, 1.0],
        ButtonType.red: [0.0, 1.0],
      }[this]!;
}
