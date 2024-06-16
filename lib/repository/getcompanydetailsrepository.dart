import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/getcompanydetails_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';

class GetCompanyDetailsRepository {
  final preferences = Preferences();
  final dioclient = DioClient();

  Future<String> getpassword() async {
    return await preferences.getAppPassword();
  }

  Future<GetCompanyDetailsResponse> getCompanyDetails() async {
    final token = await preferences.getToken();
    try {
      var response = await dioclient
          .get(getcompanydetaiilsuRL, {'Authorization': 'Bearer $token '}, {});
      return GetCompanyDetailsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getCompanyName() async {
    return await preferences.getCompanyName();
  }

  Future<String> getAddress() async {
    return await preferences.getAddress();
  }

  Future<String> getCompanyImage() async {
    return await preferences.getCompanyImage();
  }
}
