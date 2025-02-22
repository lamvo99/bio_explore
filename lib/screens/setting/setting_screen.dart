// ignore_for_file: use_build_context_synchronously

// Dart imports:

// Flutter imports:

import 'package:bio_explore/app_common_data/common_data/in_app_notification.dart';
import 'package:bio_explore/app_common_data/widgets/in_app_noti_listener.dart';
import 'package:bio_explore/public_providers/export.dart';
import 'package:bio_explore/screens/setting/cubit/setting_cubit.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '/screens/bloc_base_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late BuildContext _context;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBaseScreen<SettingCubit, SettingState>(
      createCubit: (context) => SettingCubit(),
      onShowSuccess: (_, state) => Future(() => null),
      onShowSuccessDone: (_, state) {
        context.read<AppNotificationCubit>().notifyInApp(InAppNotification(
            type: state.status!.action!, data: state.status!.data));
      },
      listeners: [
        ///
        ///
        ///
        InAppNotiListener(
          listener: (context, state, inAppNoti) async {},
        ),
      ],
      builder: (context, state) {
        _context = context;
        return AppContainer(
          child: AppText("Home"),
        );
      },
    );
  }
}
