import 'package:cnfaceattendance/data/local/db/face_id_db.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/delete_face_id_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';
import '../data/local/preferences.dart';
import '../data/remote/dio_client/dio_client.dart';

class DeleteFaceIDRepository {
  final faceIdDb = FaceIdDb();
  final dioclient = DioClient();
  final preferneces = Preferences();

  Future<void> deleteFaceIdByID(int userid) async {
    faceIdDb.deleteFaceIdById(userid);
  }

  void deleteAllFaceIds(){
    faceIdDb.deleteAll();
  }
  Future<DeleteFaceIdResponse> deleteUserFromApi(int userid) async {
    final token = await preferneces.getToken();

    try {
      var response = await dioclient.post(deleteFaceIdUrl, {'user_id': userid},
          {}, {'Authorization': 'Bearer $token'});
      return DeleteFaceIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
