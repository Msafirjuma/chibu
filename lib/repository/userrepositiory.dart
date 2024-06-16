import 'package:cnfaceattendance/data/local/db/userdb.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/usercreate_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';
import '../data/local/preferences.dart';
import '../model/isarmodel/usermodel.dart';

class UserRepositiory {
  final UserDb userDb = UserDb();
  final DioClient dioClient = DioClient();
  final Preferences preferences = Preferences();

  void addUser(User user) async {
    userDb.createUser(user);
  }

  Future<UserCreateResponse?> saveUser(String image, String name, String dob,
      String email, String mobile, String address, int shiftid, int departmentId) async {
    var token = await preferences.getToken();
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
        'department_id':departmentId

      });
      var response = await dioClient.postForImageUpload(
          saveUserurl, formData, {'Authorization': 'Bearer $token'});

      return UserCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
