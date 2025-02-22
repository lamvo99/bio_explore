// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '/public_providers/config/bloc_base_state.dart';
import '/public_providers/config/update_bloc_base_state.dart';
import '/shared_customization/data/screen_value.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState>
    with UpdateBlocBaseState<MapState> {
  MapCubit() : super(const MapState.initial());

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));
  @override
  void resetStatus() => emit(state.copyWith(status: null));
}
