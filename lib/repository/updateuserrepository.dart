import 'package:cnfaceattendance/data/local/db/face_id_db.dart';
import 'package:cnfaceattendance/data/local/db/userdb.dart';
import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/updateuser_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';

import '../model/isarmodel/usermodel.dart';

class UpdateUserRepositiory {
  final dioclient = DioClient();
  final Preferences preferences = Preferences();
  final userdb = UserDb();
  final faceID = FaceIdDb();

  Future<User?> getUserFromuserId(int userId) async {
    return await userdb.getUserFromuserId(userId);
  }

  void createUser(User user) async {
    userdb.createUser(user);
  }

  void createAlluser(List<User> user) async {
    userdb.createAlluser(user);
  }

  Future<UpdateUserResponse?> updateUser(
      String image,
      String name,
      String dob,
      String email,
      String mobile,
      String address,
      int shiftid,
      int userId, int departmentId) async {
    final token = await preferences.getToken();
    try {

      final formData = FormData.fromMap({
        'image': image.isEmpty
            ? ''
            : await MultipartFile.fromFile(image, filename: 'userImage.jpg'),
        'name': name,
        'dob': dob,
        'email': email,
        'mobile': mobile,
        'address': address,
        'shift_id': shiftid,
        'user_id': userId,
        'department_id':departmentId
      });
      final response = await dioclient.postForImageUpload(
          updateUserurl, formData, {'Authorization': 'Bearer $token'});

      return UpdateUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
