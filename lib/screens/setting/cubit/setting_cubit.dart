// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '/public_providers/config/bloc_base_state.dart';
import '/public_providers/config/update_bloc_base_state.dart';
import '/shared_customization/data/screen_value.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

class SettingCubit extends Cubit<SettingState>
    with UpdateBlocBaseState<SettingState> {
  SettingCubit() : super(const SettingState.initial());

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));
  @override
  void resetStatus() => emit(state.copyWith(status: null));
}
