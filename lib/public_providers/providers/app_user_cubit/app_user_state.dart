part of 'app_user_cubit.dart';

@freezed
class AppUserState with _$AppUserState {
  const factory AppUserState.initial({
    String? locale,
    @Default(false) bool isLoading,
    @Default(ConnectivityState.connected) connectivityState,
  }) = _Initial;
}
