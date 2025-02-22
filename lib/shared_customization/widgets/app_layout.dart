// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/app_common_data/routes/app_routes.dart';
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/buttons/app_icon_button.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:

// Project imports:
import '/shared_customization/extensions/build_context_ext.dart';
import 'buttons/app_button.dart';
import 'texts/app_text_field.dart';

class AppLayout extends StatefulWidget {
  final bool useSafeArea;
  final bool reviseColor;
  final Widget body;
  final String? title;
  final Widget? titleWidget;
  final bool showAppBar;
  final double elevation;
  final bool resizeToAvoidBottomInset;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;
  final Color? appbarShadowColor;
  final Color appBarColor;
  final Color statusBarColor;
  final Color? titleColor;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Future<bool> Function()? onWillPop;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final double? leadingWidth;
  final Color? bottomColor;
  final String? placeholder;
  final bool? isSearch;
  final Widget? widgetSearch;
  final Function(String value)? onChangeSearch;
  final Widget? aboveButton;
  final bool? isShowBottomButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool? drawerEnableOpenDragGesture;

  const AppLayout({
    super.key,
    required this.body,
    this.useSafeArea = true,
    this.title,
    this.isSearch = false,
    this.widgetSearch,
    this.onChangeSearch,
    this.placeholder = "Nhập",
    this.reviseColor = false,
    this.titleWidget,
    this.showAppBar = true,
    this.elevation = 0,
    this.resizeToAvoidBottomInset = true,
    this.actions,
    this.leading,
    this.bottomColor = AppColors.white,
    this.backgroundColor = AppColors.white,
    this.appbarShadowColor,
    this.appBarColor = const Color(0xFFFFFFFF),
    this.statusBarColor = const Color(0xFFFFFFFF),
    this.titleColor,
    this.bottomNavigationBar,
    this.drawer,
    this.onWillPop,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.leadingWidth,
    this.aboveButton,
    this.isShowBottomButton = true,
    this.drawerEnableOpenDragGesture = true,
    this.scaffoldKey,
  });

  AppLayout.buttonNextPage({
    super.key,
    this.title,
    this.titleWidget,
    this.reviseColor = false,
    this.showAppBar = true,
    this.elevation = 0,
    this.resizeToAvoidBottomInset = true,
    this.actions,
    this.leading,
    this.bottomColor = AppColors.white,
    this.backgroundColor = AppColors.white,
    this.appbarShadowColor,
    this.appBarColor = const Color(0xFFFFFFFF),
    this.statusBarColor = const Color(0xFFFFFFFF),
    this.titleColor,
    this.bottomNavigationBar,
    this.drawer,
    this.onWillPop,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.leadingWidth,
    required Widget child,
    required VoidCallback onButtonTap,
    String? buttonLabel,
    EdgeInsetsGeometry paddingAll = const EdgeInsets.all(0),
    this.placeholder,
    this.isSearch,
    this.widgetSearch,
    this.onChangeSearch,
    this.aboveButton,
    this.isShowBottomButton = true,
    this.drawerEnableOpenDragGesture = true,
    this.scaffoldKey,
  })  : useSafeArea = true,
        body = AppContainer(
          width: 1.sw,
          height: 1.sh,
          // color: AppColors.white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: AppContainer(
                    padding: paddingAll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        child,
                      ],
                    ),
                  ),
                ),
              ),
              if (isShowBottomButton != false)
                AppContainer(
                  color: AppColors.white,
                  boxShadow: AppColors.shadow,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      if (aboveButton != null) aboveButton,
                      AppButton(
                        label: buttonLabel,
                        onPressed: onButtonTap,
                        width: 1.sw,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                      ),
                    ],
                  ),
                )
            ],
          ),
        );

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: widget.backgroundColor,
        systemNavigationBarDividerColor: widget.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        // statusBarColor:
        //     widget.showAppBar ? widget.statusBarColor : AppColors.white,
        statusBarColor: widget.statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: true,
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture ?? true,
      backgroundColor: widget.backgroundColor,
      drawer: widget.drawer,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: !widget.showAppBar
          ? null
          : AppBar(
              toolbarHeight: widget.showAppBar ? null : 0,
              shadowColor: widget.appbarShadowColor ?? AppColors.transparent,
              elevation: widget.elevation,
              backgroundColor: widget.appBarColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: widget.backgroundColor,
                systemNavigationBarDividerColor: widget.backgroundColor,
                systemNavigationBarIconBrightness: Brightness.dark,
                statusBarColor: widget.showAppBar
                    ? widget.statusBarColor
                    : AppColors.transparent,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemStatusBarContrastEnforced: true,
              ),
              scrolledUnderElevation: 0.0,
              forceMaterialTransparency: true,
              leadingWidth: widget.leadingWidth,
              leading: Builder(
                builder: (context) {
                  Widget widgetBuilder = const SizedBox.shrink();
                  if (widget.leading != null) {
                    widgetBuilder = widget.leading!;
                  } else if (widget.drawer != null) {
                    widgetBuilder = AppIconButton(
                      onPressed: context.openDrawer,
                      icon: Icons.menu_rounded,
                      size: 23,
                      color: [
                        AppColors.primary600,
                        AppColors.primary600,
                        AppColors.primary600
                      ].contains(widget.appBarColor)
                          ? AppColors.white
                          : AppColors.primary600,
                    );
                  } else {
                    widgetBuilder = GestureDetector(
                      onTap: () {
                        widget.onWillPop?.call().then((value) {
                          if (value != false) {
                            Navigator.of(context).canPop()
                                ? Navigator.of(context).pop()
                                : Navigator.of(context)
                                    .pushReplacementNamed(Routes.mainScreen);
                          }
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 20,
                          height: 20,
                          child: Assets.icons.icArrowLeft.svg()),
                    );
                  }
                  return widgetBuilder;
                },
              ),
              titleSpacing: 0,
              centerTitle: true,
              title: widget.isSearch == true
                  ? widget.widgetSearch ??
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: AppTextField(
                          onChanged: (value) {
                            widget.onChangeSearch!.call(value);
                            // Call a method to handle search
                            // _handleSearch(_searchQuery);
                          },
                          autofocus: true,
                          borderRadius: BorderRadius.circular(32),
                          maxLines: 1,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          placeholder: widget.placeholder ??
                              i18n.CommonAction.EnterText,
                        ),
                      )
                  : widget.titleWidget ??
                      AppText(
                        widget.title ?? "",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textGray90016W600,
                      ),
              actions: widget.actions,
            ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF9BD8DD), // Top color
              widget.bottomColor ?? AppColors.white, // Bottom color
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          top: widget.useSafeArea,
          bottom: widget.useSafeArea,
          child: Container(
            color: AppColors.bg,
            child: widget.body,
          ),
        ),
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
    );
  }
}
