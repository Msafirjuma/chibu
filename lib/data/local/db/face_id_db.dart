import 'package:cnfaceattendance/controller/isarcontroller.dart';
import 'package:cnfaceattendance/model/isarmodel/face_id_model.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class FaceIdDb {
  final IsarController model = Get.find();

  void createFaceId(FaceIdModel faceIdModel) async {
    await model.isar.writeTxn(() async {
      await model.isar.faceIdModels.put(faceIdModel);
    });
  }
  void createAllFaceId(List<FaceIdModel>faceId)async{
    await model.isar.writeTxn(()async {
      await model.isar.faceIdModels.putAll(faceId);
    });
  }
  Future<List<FaceIdModel>> getAllFaceId() async {
    return await model.isar.faceIdModels.where().findAll();
  }

  Future<List<FaceIdModel>> getAllFaceIdByUserId(int value) async {
    return await model.isar.faceIdModels.filter().userIdEqualTo(value).findAll();
  }

  Future<FaceIdModel?> getFaceIDFromuserId(int userID) async {
    return await model.isar.faceIdModels.filter().userIdEqualTo(userID).findFirst();
  }
  void deleteAll() async {
    model.isar.writeTxn(
          () async {
        await model.isar.faceIdModels.where().deleteAll();
      },
    );
  }
  void deleteFaceIdById(int userid) async {
    model.isar.writeTxn(
          () async {
        await model.isar.faceIdModels.filter().userIdEqualTo(userid).deleteAll();
      },
    );
  }

}
