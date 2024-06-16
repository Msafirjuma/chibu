import 'dart:io';

import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/getallfaceids_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';

import '../data/local/db/face_id_db.dart';
import '../data/local/preferences.dart';
import '../data/remote/dio_client/dio_client.dart';
import '../model/isarmodel/face_id_model.dart';

class GetAllFaceaIdsRepository {
  final DioClient dioClient = DioClient();
  final prefernces = Preferences();
  final faceIdDb = FaceIdDb();

  void createAllFaceIDs(List<FaceIdModel> faceIds) async {
    faceIdDb.createAllFaceId(faceIds);
  }


  Future<GetAllFaceIsResponse> getallFaceIDFromApi() async {
    try {
      final token = await prefernces.getToken();
      var response = await dioClient
          .get(getallFaceIdUrl, {'Authorization': 'Bearer $token'}, {});
      return GetAllFaceIsResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw 'No Internet Connection';
      }else{
      throw exceptionHandler(e);}
    } catch (e) {
      rethrow;
    }
  }
}
