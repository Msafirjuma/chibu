import 'dart:io';

import 'package:cnfaceattendance/data/local/db/face_id_db.dart';
import 'package:cnfaceattendance/data/local/db/userdb.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/getuser_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../data/local/preferences.dart';
import '../model/isarmodel/usermodel.dart';

class GetUserRepositiory {
  final DioClient dioClient = DioClient();
  final Preferences preferences = Preferences();
  final UserDb userDb = UserDb();
  final FaceIdDb faceIdDb = FaceIdDb();

  Query<User> queryForAlluser() {
    return userDb.queryForAlluser();
  }

  Future<List<User>> getAlluser() async {
    return await userDb.getAlluser();
  }

  Future<int> getAllFaceIdByUserId(int value) async {
    return (await faceIdDb.getAllFaceIdByUserId(value)).length;
  }

  void createAlluser(List<User> user) async {
    userDb.createAlluser(user);
  }

  Future<GetUserResponse?> getUserListFromApi() async {
    final token = await preferences.getToken();
    try {
      var response = await dioClient
          .get(getuserListurl, {"Authorization": "Bearer $token"}, {});
      return GetUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw 'No Internet Connection';
      } else {
        throw exceptionHandler(e);
      }
    } catch (e) {
      rethrow;
    }
  }
}
