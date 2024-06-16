import 'package:cnfaceattendance/model/isarmodel/face_id_model.dart';
import 'package:cnfaceattendance/model/isarmodel/usermodel.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarController extends GetxController{
late Isar isar;
@override
  void onInit() async{
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [UserSchema,FaceIdModelSchema],
    directory: dir.path,
    inspector: true,
  );
    super.onInit();
  }
}