part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState, BlocBaseState {
  const factory HomeState.initial({
    String? errorMessage,
    ScreenValue? status,
  }) = _Initial;
}
