part of 'setting_cubit.dart';

@freezed
class SettingState with _$SettingState, BlocBaseState {
  const factory SettingState.initial({
    String? errorMessage,
    ScreenValue? status,
  }) = _Initial;
}
