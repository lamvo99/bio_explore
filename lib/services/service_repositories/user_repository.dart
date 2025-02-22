// Project imports:

import 'package:bio_explore/services/apis/api_client.dart';

class UserRepository {
  final ApiClient apis;

  const UserRepository({required this.apis});

  // Future<User?> getUserInfo() async {
  //   try {
  //     ApiResponse<User> res = await apis.getUserInfo();
  //
  //     if (res.data != null) {
  //       return res.data;
  //     }
  //     return null;
  //   } catch (err) {
  //     rethrow;
  //   }
  // }

}
