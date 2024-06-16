import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/getdepartment.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';

class DepartmentRepository {
  final dioClient = DioClient();
  final preferences = Preferences();

  Future<GetDepartmentResponse?> getAllDepartment() async {
    var token = await preferences.getToken();
    try {
      var response = await dioClient
          .get(getdepartmentUrl, {'Authorization': 'Bearer $token'}, {});
      return GetDepartmentResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
