// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '/public_providers/config/bloc_base_state.dart';
import '/public_providers/config/update_bloc_base_state.dart';
import '/shared_customization/data/screen_value.dart';

part 'collections_state.dart';
part 'collections_cubit.freezed.dart';

class CollectionsCubit extends Cubit<CollectionsState>
    with UpdateBlocBaseState<CollectionsState> {
  CollectionsCubit() : super(const CollectionsState.initial());

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));
  @override
  void resetStatus() => emit(state.copyWith(status: null));
}
