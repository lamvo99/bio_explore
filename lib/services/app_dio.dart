// Flutter imports:
import 'package:bio_explore/app_common_data/common_data/global_key_variable.dart';
import 'package:bio_explore/app_common_data/common_data/global_variable.dart';
import 'package:bio_explore/shared_customization/extensions/string_ext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppStrings {
  static const String NOT_HAVE_PERMISSION_ERROR_CODE = 'ERR.AUTH0101';
  static const String INVALID_TOKEN_ERROR_CODE = 'ERR.TOK0101';
  static const String REVOKED_TOKEN_ERROR_CODE = 'ERR.TOK0103';
  static const String EXPIRED_TOKEN_ERROR_CODE = 'ERR.TOK0102';
  static const String INVALID_REFRESH_TOKEN_ERROR_CODE = 'ERR.TOK0201';
  static const String EXPIRED_REFRESH_TOKEN_ERROR_CODE = 'ERR.TOK0202';
  static const String REVOKED_REFRESH_TOKEN_ERROR_CODE = 'ERR.TOK0203';
}

class ConnectivityInterceptor extends Interceptor {
  ConnectivityInterceptor();

  // Future<ConnectivityState>? get _checkNetworkConnectivityState =>
  //     GlobalKeyVariable.navigatorState.currentContext
  //         ?.read<AppUserCubit>()
  //         .checkNetworkByIP();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(DioException(
          requestOptions: err.requestOptions,
          message: noInternet,
          error: noInternet,
          response: Response(
              requestOptions: err.requestOptions,
              statusCode: 503,
              statusMessage: noInternet)));
    }
    return super.onError(err, handler);
  }
}

class AppDio with DioMixin implements Dio {
  bool isRefreshingToken = false;
  final _requestsNeedRetry =
      <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  AppDio() {
    print("#########################555");
    options = BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print("#########################555999");
    if (kDebugMode) {
      interceptors.add(
        TalkerDioLogger(
          talker: GetIt.instance.get<Talker>(),
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: false,
            printResponseHeaders: false,
            printResponseMessage: true,
          ),
        ),
        // PrettyDioLogger(requestBody: true),
      );
    }

    interceptors.add(ConnectivityInterceptor());

    interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final String? token = sp.prefs.getString('access_token');
        if (token.isNotEmptyOrNull) {
          options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        final String? rfToken = sp.prefs.getString('refresh_token');
        if (error.requestOptions.uri.path.endsWith('/refresh_tokens')) {
          isRefreshingToken = false;
          BuildContext? globalContext =
              GlobalKeyVariable.navigatorState.currentContext;

          if (globalContext != null) {
            // showErrorDialogExpired(
            //   onDone: () {
            //     sp.prefs.clear();
            //
            //     globalContext
            //         .read<AppUserCubit>()
            //         .updateState((p0) => p0.copyWith(user: null));
            //     final routeState = globalContext.read<PageRouterCubit>().state;
            //     if (routeState.currentPageName != Routes.loginScreen) {
            //       GlobalKeyVariable.navigatorState.currentContext!
            //           .pushNamed(Routes.loginScreen);
            //     }
            //   },
            //   title: tr(LocaleKeys.CommonData_Error),
            //   content: tr(LocaleKeys.Notification_Session_Off),
            // );
          } else {
            await sp.prefs.clear();
            return handler.next(error);
          }
          // throw AppStrings.INVALID_REFRESH_TOKEN_ERROR_CODE;
        } else if (error.requestOptions.uri.path.endsWith('oauth/revoke')) {
          return handler.reject(
            error.copyWith(
              response: Response(requestOptions: error.requestOptions, data: {
                "status": "failure",
                "error": {
                  "code": "ERR.TOK0103",
                  "message": "Revoked token!",
                }
              }),
            ),
          );
        } else if (error.response != null) {
          if (error.response?.statusCode == 500 ||
              error.response?.statusCode == 404) {
            return handler.next(error);
          }
          if (error.response?.statusCode == 502) {
            BuildContext? globalContext =
                GlobalKeyVariable.navigatorState.currentContext;

            if (globalContext != null) {
              // showErrorDialogExpired(
              //   onDone: () {
              //     sp.prefs.clear();
              //     globalContext
              //         .read<AppUserCubit>()
              //         .updateState((p0) => p0.copyWith(user: null));
              //     final routeState =
              //         globalContext.read<PageRouterCubit>().state;
              //     if (routeState.currentPageName != Routes.loginScreen) {
              //       GlobalKeyVariable.navigatorState.currentContext!
              //           .pushNamed(Routes.loginScreen);
              //     }
              //   },
              //   title: tr(LocaleKeys.CommonData_Error),
              //   content: tr(LocaleKeys.Notification_Server_Off),
              // );
            } else {
              await sp.prefs.clear();
              return handler.next(error);
            }
          }

          if (error.requestOptions.headers.containsKey('Authorization')) {
            switch (error.response?.data['error']['code']) {
              case AppStrings.INVALID_TOKEN_ERROR_CODE:
              case AppStrings.REVOKED_TOKEN_ERROR_CODE:
              case AppStrings.EXPIRED_TOKEN_ERROR_CODE:
                if (isRefreshingToken) {
                  _requestsNeedRetry.add((
                    options: error.response!.requestOptions,
                    handler: handler
                  ));
                } else {
                  isRefreshingToken = true;
                  _requestsNeedRetry.add((
                    options: error.response!.requestOptions,
                    handler: handler
                  ));

                  try {
                    // Credential? newToken = await refreshToken(rfToken ?? "");
                    //
                    // if (newToken != null) {
                    //   for (var requestNeedRetry in _requestsNeedRetry) {
                    //     requestNeedRetry.options.headers['Authorization'] =
                    //         'Bearer ${newToken.accessToken}';
                    //     await fetch(requestNeedRetry.options).then((response) {
                    //       requestNeedRetry.handler.resolve(response);
                    //     }).catchError((_) {});
                    //   }
                    //
                    //   _requestsNeedRetry.clear();
                    //   isRefreshingToken = false;
                    // } else {
                    //   _requestsNeedRetry.clear();
                    //   if (GlobalKeyVariable.navigatorState.currentContext ==
                    //       null) {
                    //     await sp.prefs.clear();
                    //     return handler.next(error);
                    //   }
                    // }
                  } catch (err) {
                    _requestsNeedRetry.clear();
                    if (GlobalKeyVariable.navigatorState.currentContext ==
                        null) {
                      await sp.prefs.clear();
                      return handler.next(error);
                    }
                  } finally {
                    isRefreshingToken = false;
                  }
                }
              // return handler.next(error);
              default:
                return handler.next(error);
            }
          } else {
            return handler.next(error);
          }
        } else {
          return handler.next(error);
        }
      },
    ));

    httpClientAdapter = HttpClientAdapter();
  }

  // Future<Credential?> refreshToken(String refreshToken) async {
  //   try {
  //     final AuthenticationRepository authenticationRepository =
  //         AuthenticationRepository(apis: apis);
  //     sp.clear();
  //     Credential credential =
  //         await authenticationRepository.refreshToken(refreshToken);
  //     await sp.setToken(
  //         credential.accessToken ?? "", credential.refreshToken ?? "");
  //     return credential;
  //   } catch (err) {
  //     sp.clear();
  //     return null;
  //   }
  // }
}
