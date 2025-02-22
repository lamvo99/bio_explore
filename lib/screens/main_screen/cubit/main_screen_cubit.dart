// Package imports:
import 'package:bio_explore/app_common_data/enum/main_tabs.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '/public_providers/config/bloc_base_state.dart';
import '/public_providers/config/update_bloc_base_state.dart';
import '/shared_customization/data/screen_value.dart';

part 'main_screen_state.dart';
part 'main_screen_cubit.freezed.dart';

class MainScreenCubit extends Cubit<MainScreenState>
    with UpdateBlocBaseState<MainScreenState> {
  MainScreenCubit() : super(const MainScreenState.initial());

  changeTab(MainTabs tab) => emit(state.copyWith(currentTab: tab));

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));
  @override
  void resetStatus() => emit(state.copyWith(status: null));
}
