// Package imports:
import 'package:bio_explore/app_common_data/common_data/global_variable.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/services/models/api_response/api_response.dart';
import 'package:bio_explore/shared_customization/extensions/string_ext.dart';
import 'package:dio/dio.dart';

String parseError(Object error) {
  String errorDescription = '';
  if (error is DioException) {
    if (error.message == noInternet ||
        error.type == DioExceptionType.connectionError) {
      errorDescription = noInternet;
    } else if (error.response?.statusCode == 404) {
      // if (tr('Error.${'${error.response?.data['error']['code']}'.replaceAll('.', '')}') ==
      //     'Error.${'${error.response?.data['error']['code']}'.replaceAll('.', '')}') {
      //   errorDescription = error.response?.data["error"]["message"];
      // } else {
      //   errorDescription = tr(
      //       'Error.${'${error.response?.data['error']['code']}'.replaceAll('.', '')}');
      // }
    // } else if (tr(
    //         'Error.${'${error.response?.data['error']['code']}'.replaceAll('.', '')}') ==
    //     'Error.${'${error.response?.data['error']['code']}'.replaceAll('.', '')}') {
    //   errorDescription = error.response?.data["error"]["message"];
    } else {
      // if (error.message == GlobalKey.noInternet) {
      //   errorDescription = error.message!;
      // } else {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = i18n.Error.CancalledApiError;
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = i18n.Error.ConnectionTimeoutError;
          break;
        case DioExceptionType.connectionError:
          errorDescription = i18n.Error.ConnectionError;
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = i18n.Error.ReceiveTimeoutError;
          break;

        case DioExceptionType.badResponse:
          try {
            final data = error.response?.data as Map<String, dynamic>;
            final response = ApiResponse.fromJson(data, (p0) => data);
            errorDescription =" response.message";
            // errorDescription = response.errors?.values
            //         .expand((e) => e)
            //         .join('\n') ??
            //     response.message ??
                // tr('Error.${'${error.response?.data['error']['code']}'.replaceAll('.', '')}');
          } catch (e) {
            errorDescription =" response.message";
            // errorDescription = tr(
            //     'Error.${'${error.response?.data['error']['code']}'.replaceAll('.', '')}');
          }

          break;
        case DioExceptionType.sendTimeout:
          errorDescription = i18n.Error.SendTimeoutError;
          break;
        case DioExceptionType.badCertificate:
          errorDescription = '[ValidateCertificate] で構成された証明書が正しくないことが原因です。';
          break;
        case DioExceptionType.unknown:
          errorDescription = i18n.Error.UnexpectedError;
          break;
      }
    }
    return errorDescription;
  } else if (error is Response) {
    return parseError((error).data);
  } else if (error is Map<String, dynamic> && error['error'] is String) {
    return parseError(error['error']);
  } else if (error is Map<String, dynamic> && error['error'] is Map) {
    return parseError(error['error']);
  } else if (error is Map<String, dynamic> &&
      error['code'] is String &&
      (error['code'] as String).isNotEmptyOrNull) {
    return 'Error.${'${error['code']}'.replaceAll('.', '')}';
  }
  return error.toString();
}
