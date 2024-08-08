import 'package:byrahul/constant.dart';
import 'package:dio/dio.dart';

import '../model/userView_model.dart';

class UserViewService {
  static Future<UserviewHome?> getUserHome() async {
    UserviewHome? finalResponse;
    try {
      var response = await dio.get('$URI/frontend/home');
      finalResponse = UserviewHome.fromJson(response.data);
      return finalResponse;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
