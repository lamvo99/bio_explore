part of 'collections_cubit.dart';

@freezed
class CollectionsState with _$CollectionsState, BlocBaseState {
  const factory CollectionsState.initial({
    String? errorMessage,
    ScreenValue? status,
  }) = _Initial;
}
