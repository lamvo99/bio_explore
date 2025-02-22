// Flutter imports:
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/screens/collections/collections_screen.dart';
import 'package:bio_explore/screens/home/home_screen.dart';
import 'package:bio_explore/screens/map/map_screen.dart';
import 'package:bio_explore/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:

enum MainTabs {
  home,
  map,
  collection,
  setting,
}

extension MainTabsExt on MainTabs {
  String get title =>
      {
        MainTabs.home: i18n.MainTab.Home,
        MainTabs.map: i18n.MainTab.Map,
        MainTabs.collection: i18n.MainTab.Collection,
        MainTabs.setting: i18n.MainTab.Settings,
      }[this]!;

  SvgGenImage get icon =>
      {
        MainTabs.home: Assets.icons.icHome,
        MainTabs.map: Assets.icons.icMap,
        MainTabs.collection: Assets.icons.icCollection,
        MainTabs.setting: Assets.icons.icSetting,
      }[this]!;

  SvgGenImage get iconAcctive =>
      {
        MainTabs.home: Assets.icons.icHomeActive,
        MainTabs.map: Assets.icons.icMapActive,
        MainTabs.collection: Assets.icons.icCollectionActive,
        MainTabs.setting: Assets.icons.icSettingActive,
      }[this]!;

  bool get isShowAppBar =>
      {
        MainTabs.home: false,
        MainTabs.map: false,
        MainTabs.collection: false,
        MainTabs.setting: false,
      }[this]!;

  Widget get widget =>
      {
        MainTabs.home: const HomeScreen(),
        MainTabs.map: const MapScreen(),
        MainTabs.collection: const CollectionsScreen(),
        MainTabs.setting: const SettingScreen(),
      }[this]!;

  List<Widget> actions(BuildContext context) =>
      {
        MainTabs.home: <Widget>[],
        MainTabs.map: <Widget>[],
        MainTabs.collection: <Widget>[],
        MainTabs.setting: <Widget>[],
      }[this]!;
}
