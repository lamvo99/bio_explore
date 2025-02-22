// Project imports:

import 'package:bio_explore/app_common_data/enum/in_app_notification_actions.dart';
import 'package:bio_explore/shared_customization/enums/screen_status.dart';

class ScreenValue {
  final ScreenStatus status;
  final dynamic data;
  final InAppNotificationActions? action;

  ScreenValue({required this.status, this.data, this.action});

  factory ScreenValue.init(
      {dynamic data, InAppNotificationActions? action}) =>
      ScreenValue(status: ScreenStatus.init, data: data, action: action);

  factory ScreenValue.running(
      {dynamic data, InAppNotificationActions? action}) =>
      ScreenValue(status: ScreenStatus.running, data: data, action: action);

  factory ScreenValue.success(
          {dynamic data, InAppNotificationActions? action}) =>
      ScreenValue(status: ScreenStatus.success, data: data, action: action);

  factory ScreenValue.failed(
          {dynamic data, InAppNotificationActions? action}) =>
      ScreenValue(status: ScreenStatus.failed, data: data, action: action);

  ScreenValue copyWith({
    ScreenStatus? status,
    dynamic data,
    InAppNotificationActions? action,
  }) =>
      ScreenValue(
          status: status ?? this.status,
          data: data ?? this.data,
          action: action ?? this.action);
}
