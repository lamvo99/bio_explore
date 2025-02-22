// // Flutter imports:
// import 'package:bio_explore/public_providers/export.dart';
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// // Project imports:
//
// class RealTimeNotiListener
//     extends BlocListener<AppNotificationCubit, AppNotificationState> {
//   RealTimeNotiListener({
//     super.key,
//     super.child,
//     required void Function(BuildContext context, AppNotificationState state,
//             NotificationItem realTimeNoti)
//         listener,
//   }) : super(
//           listenWhen: (previous, current) =>
//               previous.realTimeNotification != current.realTimeNotification &&
//               current.realTimeNotification != null,
//           listener: (context, state) {
//             listener.call(context, state, state.realTimeNotification!);
//           },
//         );
// }
