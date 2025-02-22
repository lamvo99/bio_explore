part of 'map_cubit.dart';

@freezed
class MapState with _$MapState, BlocBaseState {
  const factory MapState.initial({
    String? errorMessage,
    ScreenValue? status,
  }) = _Initial;
}
