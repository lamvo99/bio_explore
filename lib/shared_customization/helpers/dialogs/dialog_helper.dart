// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// Project imports:
import '/app_common_data/app_colors.dart';
import '/shared_customization/helpers/dialogs/content_widgets/confirm_dialog_content.dart';
import '/shared_customization/helpers/dialogs/content_widgets/error_dialog_content.dart';
import '/shared_customization/helpers/dialogs/content_widgets/loading_dialog_content.dart';
import '/shared_customization/helpers/dialogs/content_widgets/success_dialog_content.dart';
import 'content_widgets/calendar_picker_dialog.dart';

void Function() showLoading({
  WrapAnimation? wrapToastAnimation,
  BackButtonBehavior? backButtonBehavior,
  VoidCallback? onClose,
  Duration? duration,
  Duration? animationDuration,
  Duration? animationReverseDuration,
}) =>
    BotToast.showCustomLoading(
      wrapAnimation: (AnimationController controller, CancelFunc cancelFunc,
              Widget child) =>
          FadeAnimation(controller: controller, child: child),
      wrapToastAnimation: wrapToastAnimation,
      align: Alignment.center,
      enableKeyboardSafeArea: true,
      backButtonBehavior: backButtonBehavior,
      toastBuilder: (_) => const LoadingDialogContent(),
      clickClose: false,
      allowClick: false,
      crossPage: true,
      ignoreContentClick: true,
      onClose: onClose,
      duration: duration,
      animationDuration: animationDuration,
      animationReverseDuration: animationReverseDuration,
      backgroundColor: Colors.black26,
    );

Future<dynamic> showErrorDialog(
  BuildContext context, {
  String? title,
  String? content,
  VoidCallback? onAccept,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Material(
        color: AppColors.transparent,
        child: Center(
          child: ErrorDialogContent(
            title: title,
            content: content,
            onAccept: onAccept,
          ),
        ),
      );
    },
  );
}

Future<dynamic> showSuccessDialog(
  BuildContext context, {
  String? title,
  String? content,
  VoidCallback? onAccept,
}) =>
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: AppColors.transparent,
          child: Center(
              child: SuccessDialogContent(
            title: title,
            content: content,
            onAccept: onAccept,
          )),
        );
      },
    );

Future<bool?> showConfirmDialog(
  BuildContext context, {
  String? title,
  String? content,
  String? acceptLable,
  VoidCallback? onAccept,
  VoidCallback? onReject,
}) =>
    showDialog<bool>(
      context: context,
      builder: (context) {
        return Material(
          color: AppColors.transparent,
          child: Center(
              child: ConfirmDialogContent(
            content: content,
            title: title,
            acceptLable: acceptLable,
            onAccept: onAccept,
            onReject: onReject,
          )),
        );
      },
    );

Future<bool?> showCalendarPicker(
  BuildContext context, {
  required Function onChanged,
  DateTime? initDateTime,
  DateTime? minDate,
  DateTime? lastDate,
  DateRangePickerSelectionMode selectionMode =
      DateRangePickerSelectionMode.single,
  PickerDateRange? initDateRange,
}) =>
    showDialog<bool>(
      context: context,
      builder: (context) {
        return Material(
          color: AppColors.transparent,
          child: Center(
              child: CalendarPickerDialog(
            onChanged: onChanged,
            initDateTime: initDateTime,
            minDate: minDate,
            lastDate: lastDate,
            selectionMode: selectionMode,
            initDateRange: initDateRange,
          )),
        );
      },
    );


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToastDialog(
        {required BuildContext context, required String content}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );

