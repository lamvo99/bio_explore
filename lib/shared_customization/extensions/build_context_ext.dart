// ignore_for_file: deprecated_member_use

// Flutter imports:
import 'package:bio_explore/shared_customization/extensions/color_ext.dart';
import 'package:bio_explore/shared_customization/extensions/text_style_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:

// Project imports:

extension BuildContextExt on BuildContext {
  ///
  /// MediaQuery
  ///
  Size get screenSize => MediaQuery.of(this).size;

  EdgeInsets get viewInset => MediaQuery.of(this).viewInsets;

  EdgeInsets get viewPadding => MediaQuery.of(this).padding;

  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  Orientation get orientation => MediaQuery.of(this).orientation;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;

  ///
  /// Localizations
  ///
  // Locale get currentLocale => locale;

  // String get currentLanguageCode => currentLocale.languageCode;

  ///
  /// ThemeData
  ///
  ThemeData get theme => Theme.of(this);

  ///
  /// Drawer
  ///
  bool get hasDrawer => Scaffold.of(this).hasDrawer;

  void openDrawer() => hasDrawer ? Scaffold.of(this).openDrawer() : null;

  void closeDrawer() => hasDrawer ? Scaffold.of(this).closeDrawer() : null;

  ///
  /// Navigator
  ///
  bool get canPop => Navigator.of(this).canPop();

  // Pop
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  // Push route
  Future<T?> pushRoute<T extends Object?>(
          Widget Function(BuildContext context) builder) =>
      Navigator.of(this).push(MaterialPageRoute(builder: builder));

  // Push named
  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  // Pop and push named
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
          String routeName,
          {TO? result,
          Object? arguments}) =>
      Navigator.of(this).popAndPushNamed<T, TO>(routeName,
          result: result, arguments: arguments);

  Future<T?> pushAndReplaceNamed<T extends Object?, TO extends Object?>(
          String routeName,
          {TO? result,
          Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed<T, TO>(routeName,
          result: result, arguments: arguments);

  ///
  /// Clipboard
  ///
  Future<void> copyToClipboard(String text) =>
      Clipboard.setData(ClipboardData(text: text));

  ///
  /// ModalRoute
  ///
  ModalRoute<dynamic>? get modalRoute => ModalRoute.of(this);

  T? getArguments<T>() =>
      modalRoute == null ? null : ModalRoute.of(this)!.settings.arguments as T?;

}

extension AppBarHelper on BuildContext {
  AppBar materialYouAppBar(
    String title, {
    List<Widget>? actions,
    Widget? leadingWidget,
  }) {
    return AppBar(
      leading: leadingWidget,
      title: Text(title),
      titleTextStyle: titleLarge,
      actions: actions ?? [],
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showMaterialSnackBar(
    String content, {
    Color? backgroundColor,
    Color? color,
    SnackBarAction? action,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Text(
          content,
          style: TextStyle(
            color: color ?? onSurfaceVariant,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor ?? surfaceVariant,
        action: action,
      ),
    );
  }
}
