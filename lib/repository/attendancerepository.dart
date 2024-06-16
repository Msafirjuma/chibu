import 'package:cnfaceattendance/data/local/db/face_id_db.dart';
import 'package:cnfaceattendance/data/local/db/userdb.dart';
import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/model/isarmodel/face_id_model.dart';
import 'package:cnfaceattendance/model/isarmodel/usermodel.dart';
import 'package:dio/dio.dart';

import '../data/remote/dio_client/dio_client.dart';
import '../data/remote/network_url/network_url.dart';
import '../data/remote/response/saveemployeeattendanceresponse.dart';
import '../utils/exceptionhandler.dart';

class AttendanceRepository {
  final faceIdDB = FaceIdDb();
  final userDb = UserDb();
  final dioclient = DioClient();
  final preferences = Preferences();

  Future<List<FaceIdModel>> getAllFaceIds() async {
    return await faceIdDB.getAllFaceId();
  }

  Future<String> getToken() async {
    return await preferences.getToken();
  }

  Future<User?> getUserById(int userId) async {
    return await userDb.getUserFromuserId(userId);
  }

  Future<SaveEmployeeAttendanceResponse> saveEmployeeAttendance(
      int userid, String attenancetype, String reason, String image) async {
    final token = await preferences.getToken();
    try {
      final formData = FormData.fromMap({
        'image': image.isEmpty
            ? ''
            : await MultipartFile.fromFile(image, filename: 'userImage.jpg'),
        'user_id': userid,
        'attendanceType': attenancetype,
        'reason': reason,
      });
      var response = await dioclient.postForImageUpload(
          saveemployeeattendancedUrl,
          formData,
          {'Authorization': 'Bearer $token'});

      return SaveEmployeeAttendanceResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
