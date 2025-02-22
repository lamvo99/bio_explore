// ignore_for_file: constant_identifier_names, non_constant_identifier_names

// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/services/apis/api_client.dart';
import 'package:bio_explore/services/app_dio.dart';
import 'package:bio_explore/shared_customization/helpers/utilizations/storages.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
///
///
const double BORDER_RADIUS_VALUE = 8;

///
///
const EMPTY_WIDGET = SizedBox.shrink();
final Widget NO_DATA_WIDGET = Center(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Assets.icons.icNoData.svg(width: 215, height: 215),
      const SizedBox(height: 8),
      AppText(
        i18n.CommonData.ListDataIsEmpty,
        style: AppTextStyle.textGray90016W500,
        textAlign: TextAlign.center,
      ),
    ],
  ),
);

final DEFAUT_BOX_SHADOWN = BoxShadow(
  color: AppColors.black.withOpacity(0.4),
  blurRadius: 5.0,
  spreadRadius: 3.0,
  offset: const Offset(4, 3),
);

final Widget NO_INTERNET = Center(
  child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Assets.icons.icNoInternet.svg(width: 150, height: 150),
        // const SizedBox(height: 16),
        // AppText(
        //   tr(LocaleKeys.Branch_NoInternet),
        //   style: AppTextStyle.textGray80016W600,
        // ),
        // const SizedBox(height: 8),
        // AppText(
        //   tr(LocaleKeys.Branch_CheckInternet),
        //   style: AppTextStyle.textGray80014W400,
        // ),
      ]),
);

///
///
///
ApiClient apis = ApiClient(AppDio());
CustomSharedPreferences sp = CustomSharedPreferences();

/////
const String noInternet = 'NO_INTERNET_CONNECTION';
