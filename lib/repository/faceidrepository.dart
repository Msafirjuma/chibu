import 'package:cnfaceattendance/data/local/db/face_id_db.dart';
import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/face_id_response.dart';
import 'package:cnfaceattendance/model/isarmodel/face_id_model.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';

class FaceIdRepository {
  final DioClient dioClient = DioClient();
  final prefernces = Preferences();

  final faceIDdb = FaceIdDb();

  Future<void> addFaceId(FaceIdModel faceIdModel) async {
    faceIDdb.createFaceId(faceIdModel);
  }

  Future<FaceIdResponse?> faceIdApi(int userid, String faceId) async {
    final token = await prefernces.getToken();
    try {
      var response = await dioClient.post(
          savefaceidurl,
          {'user_id': userid, 'data': faceId},
          {},
          {'Authorization': 'Bearer $token'});
      return FaceIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
