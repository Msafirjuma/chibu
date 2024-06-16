import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/todays_attendance_respone.dart';
import 'package:dio/dio.dart';

import '../utils/exceptionhandler.dart';

class TodayAttendanceRepository{
  final preferences=Preferences();
  final dioClient=DioClient();
  Future<TodaysAttendanceResponse> getTodaysAttendaceFromApi() async {
    try {
      final token = await preferences.getToken();
      var response = await
      dioClient .get(todayattendanceUrl, {'Authorization': 'Bearer $token'}, {});
      return TodaysAttendanceResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}