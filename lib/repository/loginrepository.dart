

import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/login_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  final DioClient dioClient = DioClient();
  final Preferences preferences = Preferences();


  void saveLoginDetails(String token,String appPassword) {
    preferences.saveToken(token);
    preferences.saveAppPassword(appPassword);
  }



  Future<LoginResponse?> loginApi(String email, String password) async {
    try {
      var response = await dioClient
          .post(loginurl, {'email': email, 'password': password}, {}, {});

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
