// Flutter imports:
import 'package:bio_explore/app_common_data/common_data/in_app_notification.dart';
import 'package:bio_explore/public_providers/export.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:

class InAppNotiListener
    extends BlocListener<AppNotificationCubit, AppNotificationState> {
  InAppNotiListener({
    super.key,
    super.child,
    required void Function(BuildContext context, AppNotificationState state,
            InAppNotification inAppNoti)
        listener,
  }) : super(
          listenWhen: (previous, current) =>
              previous.inAppNotification != current.inAppNotification &&
              current.inAppNotification != null,
          listener: (context, state) {
            listener.call(context, state, state.inAppNotification!);
          },
        );
}
