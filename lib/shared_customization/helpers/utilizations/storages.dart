// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '/shared_customization/extensions/string_ext.dart';

class CustomSharedPreferences {
  late final SharedPreferences prefs;

  String? get email => prefs.getString('email');

  String? get accessToken => prefs.getString('access_token');

  String? get refreshToken => prefs.getString('refresh_token');

  bool get loggedBefore => prefs.getBool('logged_before') ?? false;

  set loggedBefore(bool value) => prefs.setBool('logged_before', value);

  bool get keepLogin => prefs.getBool('keep_login') ?? false;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future setToken(String accessToken, String refreshToken) async {
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
    debugPrint(
        "DEBUG: ===> Check storages: $accessToken -------- $refreshToken");
  }

  Future setMail(String email) async {
    await prefs.setString('email', email);
    debugPrint(
        "DEBUG: ===> Check storages: $accessToken -------- $refreshToken");
  }

  bool isEmtpty() {
    return (prefs.getString('access_token').isEmptyOrNull ||
        prefs.getString('refresh_token').isEmptyOrNull);
  }

  Future clear() async {
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

}
