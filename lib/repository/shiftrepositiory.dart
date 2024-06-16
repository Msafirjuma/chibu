
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/shift_response.dart';
import 'package:dio/dio.dart';
import '../data/local/preferences.dart';
import '../data/remote/dio_client/dio_client.dart';
import '../utils/exceptionhandler.dart';

class ShiftRepositiory {
  final DioClient dioClient = DioClient();
  final Preferences preferences = Preferences();

  Future<ShiftResponse?> getAllShift() async {
    final token =await preferences.getToken();

    try {

      var response = await dioClient
          .get(getallshifturl, {"Authorization": "Bearer $token"}, {});
      return ShiftResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
