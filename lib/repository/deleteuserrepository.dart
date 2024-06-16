import 'package:cnfaceattendance/data/local/db/userdb.dart';
import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/deleteuser_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';

class DeleteUserRepository {
  final userDb = UserDb();
  final dioclient = DioClient();
  final preferneces = Preferences();

  Future<void> deleteUserFromDbbyId(int userid) async {
    userDb.deleteUserById(userid);
  }

  void deleteAlluser() {
    userDb.deleteAll();
  }

  Future<DeleteUserResponse> deleteUserFromApi(int userid) async {
    final token = await preferneces.getToken();
    try {
      var response = await dioclient.post(deleteUserUrl, {'user_id': userid},
          {}, {'Authorization': 'Bearer $token'});
      return DeleteUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
