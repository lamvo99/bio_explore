// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:bio_explore/app_common_data/enum/connectivity_state.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '/public_providers/config/update_state.dart';


part 'app_user_state.dart';

part 'app_user_cubit.freezed.dart';

class AppUserCubit extends Cubit<AppUserState> with UpdateState<AppUserState> {
  AppUserCubit()
      : super(AppUserState.initial(
        )) {
    Timer.periodic(const Duration(seconds: 5), (timer) => checkNetworkByIP());
  }

  ///
  /// CHECK CONNECT NETWORK
  ///
  changeConnectivityState(ConnectivityResult newConnectivity) async {
    switch (newConnectivity) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
        if (state.connectivityState == ConnectivityState.disconnected) {
          checkNetworkByIP();
        }
        break;
      case ConnectivityResult.none:
        if (state.connectivityState == ConnectivityState.connected) {
          checkNetworkByIP();
        }
        break;
      default:
    }
  }

  Future<ConnectivityState> checkNetworkByIP() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (state.connectivityState == ConnectivityState.disconnected) {
          emit(state.copyWith(connectivityState: ConnectivityState.connected));
        }
        return ConnectivityState.connected;
      } else {
        if (state.connectivityState == ConnectivityState.connected) {
          emit(state.copyWith(
              connectivityState: ConnectivityState.disconnected));
        }
        return ConnectivityState.disconnected;
      }
    } catch (err) {
      if (state.connectivityState == ConnectivityState.connected) {
        emit(state.copyWith(connectivityState: ConnectivityState.disconnected));
      }
      return ConnectivityState.disconnected;
    }
  }


  void cleanUserData() =>
      emit(AppUserState.initial());
}
