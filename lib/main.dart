import 'dart:async';

import 'package:bio_explore/app_common_data/common_data/global_variable.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'screens/my_app/my_app.dart';
import 'services/apis/api_client.dart';
import 'services/app_dio.dart';

void main() async {

  runZonedGuarded(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    Talker talker = TalkerFlutter.init();
    GetIt.instance.registerSingleton<Talker>(talker);

    // await sp.init();
    await dotenv.load(fileName: ".env");
    apis = ApiClient(AppDio(), baseUrl: dotenv.env['BASE_URL']!);


    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    ).then((val) {
      runApp(
        TalkerWrapper(
          talker: talker,
          options: const TalkerWrapperOptions(
            enableErrorAlerts: false,
          ),
          child: TranslationProvider(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: MyApp(
              ),
            ),
          ),
        ),
      );
    });

  },  (dynamic exception, StackTrace stackTrace) async {
    // await Sentry.captureException(exception, stackTrace: stackTrace);
  });

}