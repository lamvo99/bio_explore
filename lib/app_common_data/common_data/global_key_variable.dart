// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
// import 'package:flutter_alice/alice.dart';

class GlobalKeyVariable {
  GlobalKeyVariable._();

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> navigatorState =
  GlobalKey<NavigatorState>();
}
