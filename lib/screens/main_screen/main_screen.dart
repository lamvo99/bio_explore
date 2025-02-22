// ignore_for_file: use_build_context_synchronously

// Dart imports:

// Flutter imports:

import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/app_common_data/common_data/global_variable.dart';
import 'package:bio_explore/app_common_data/enum/main_tabs.dart';
import 'package:bio_explore/app_common_data/widgets/in_app_noti_listener.dart';
import 'package:bio_explore/public_providers/export.dart';
import 'package:bio_explore/screens/collections/cubit/collections_cubit.dart';
import 'package:bio_explore/screens/home/cubit/home_cubit.dart';
import 'package:bio_explore/screens/map/cubit/map_cubit.dart';
import 'package:bio_explore/screens/setting/cubit/setting_cubit.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/app_layout.dart';
import 'package:bio_explore/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '/screens/bloc_base_screen.dart';
import '/screens/main_screen/cubit/main_screen_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late BuildContext _context;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, appUserState) {
        return BlocBaseScreen<MainScreenCubit, MainScreenState>.multiProvider(
          providers: [
            BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
            BlocProvider<MapCubit>(create: (context) => MapCubit()),
            BlocProvider<CollectionsCubit>(create: (context) => CollectionsCubit()),
            BlocProvider<SettingCubit>(create: (context) => SettingCubit()),
          ],
          listeners: [
            ///
            ///  Handle RealTimeNoti
            ///

            ///
            ///
            ///
            InAppNotiListener(
              listener: (context, state, inAppNoti) async {},
            ),
          ],
          builder: (context, state) {
            _context = context;
            return AppDismissKeyboard(
              child: Scaffold(
                body: AppLayout(
                  leading: EMPTY_WIDGET,
                  onWillPop: () => Future.value(false),
                  title: state.currentTab.title,
                  body: state.currentTab.widget,
                  actions: state.currentTab.actions(context),
                  showAppBar: state.currentTab.isShowAppBar,
                  bottomNavigationBar: AppContainer(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(104, 102, 102, 0.12),
                        offset: Offset(0, -2),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ],
                    child: BottomNavigationBar(
                      items: MainTabs.values
                          .map(
                            (e) => BottomNavigationBarItem(
                              label: e.title,
                              icon: (e.title == state.currentTab.title)
                                  ? e.iconAcctive.svg(
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.primary600,
                                          BlendMode.srcIn),
                                      width: 24,
                                      height: 24,
                                    )
                                  : e.icon.svg(
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.gray600, BlendMode.srcIn),
                                      width: 24,
                                      height: 24,
                                    ),
                            ),
                          )
                          .toList(),
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      selectedLabelStyle: AppTextStyle.textGray80012W500,
                      unselectedLabelStyle: AppTextStyle.textGray80012W500
                          .copyWith(color: AppColors.gray600),
                      selectedItemColor: AppColors.primary600,
                      currentIndex: MainTabs.values.indexOf(state.currentTab),
                      onTap: (value) {
                        context
                            .read<MainScreenCubit>()
                            .changeTab(MainTabs.values[value]);
                        // if (mainTabsActive[value] == MainTabs.report) {
                        //   if (appUserState.myBranch != null) {
                        //     _context.read<ReportCubit>().initData(
                        //         appUserState.myBranch?.id ?? "");
                        //   }
                        // }
                      },
                      mouseCursor: SystemMouseCursors.grab,
                      type: BottomNavigationBarType.fixed,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
