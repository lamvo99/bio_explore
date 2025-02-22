// Flutter imports:
import 'package:bio_explore/screens/main_screen/main_screen.dart';
import 'package:bio_explore/shared_customization/extensions/build_context_ext.dart';
import 'package:bio_explore/shared_customization/widgets/custom_widgets/screens/app_image_full_screen.dart';
import 'package:flutter/material.dart';

// Project imports:

class Routes {
  Routes._();

  static String mainScreen = '/main-screen';
  static String imageFullScreen = '/image-full-screen';

  static final Map<String, Widget Function(BuildContext context)> routes = {
    mainScreen: (context) => const MainScreen(),
    imageFullScreen: (_) =>
        AppImageFullScreen(params: _.getArguments<AppImageFullScreenParams>()!),

  };
}
