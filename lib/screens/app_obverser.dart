// Flutter imports:
import "package:bio_explore/app_common_data/common_data/global_key_variable.dart";
import "package:bio_explore/public_providers/export.dart";
import "package:flutter/material.dart";

// Package imports:
import "package:connectivity_plus/connectivity_plus.dart";
import "package:flutter_bloc/flutter_bloc.dart";

// Project imports:

class AppObserverScreen extends StatefulWidget {
  final Widget child;

  const AppObserverScreen({super.key, required this.child});

  @override
  State<AppObserverScreen> createState() => _AppObserverScreenState();
}

class _AppObserverScreenState extends State<AppObserverScreen>
    with WidgetsBindingObserver {
  late BuildContext _context;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.resumed) {
      Connectivity().checkConnectivity().then((List<ConnectivityResult> value) {
        GlobalKeyVariable.navigatorState.currentContext!
            .read<AppUserCubit>()
            .changeConnectivityState(value.first);
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return widget.child;
  }
}
