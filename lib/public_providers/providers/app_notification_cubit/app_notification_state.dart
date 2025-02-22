part of 'app_notification_cubit.dart';

@freezed
class AppNotificationState with _$AppNotificationState {
  const factory AppNotificationState({
    InAppNotification? inAppNotification,
    @Default(true) bool isTurnOnNotification,
  }) = _Initial;
}
