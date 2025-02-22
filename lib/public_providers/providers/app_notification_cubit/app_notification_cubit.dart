// ignore_for_file: use_build_context_synchronously

// Dart imports:

// Flutter imports:
import 'package:bio_explore/app_common_data/common_data/in_app_notification.dart';
import 'package:bio_explore/public_providers/config/update_state.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
part 'app_notification_state.dart';

part 'app_notification_cubit.freezed.dart';

class AppNotificationCubit extends Cubit<AppNotificationState>
    with UpdateState<AppNotificationState> {
  AppNotificationCubit() : super(const AppNotificationState());


  void notifyInApp(InAppNotification noti) =>
      emit(state.copyWith(inAppNotification: noti));


  void clearNotification() => emit(const AppNotificationState());
}
