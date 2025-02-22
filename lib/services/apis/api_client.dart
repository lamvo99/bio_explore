// Package imports:
import 'package:bio_explore/services/models/api_response/api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///
  /// Authentication
  ///
  @POST('/user/auth/login')
  Future<ApiResponse> login();
}
