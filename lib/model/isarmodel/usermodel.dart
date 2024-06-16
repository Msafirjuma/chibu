import 'package:cnfaceattendance/model/isarmodel/face_id_model.dart';
import 'package:isar/isar.dart';
part 'usermodel.g.dart';
@collection
class User {
  Id id = Isar.autoIncrement;
  int userId;
  String name;
  String dob;
  String email;
  String mobile;
  String address;
  String image;
  int  shiftId;
  String shifttype;
  int departmentId;
  final faceid=IsarLinks<FaceIdModel>();
  User(this.userId,this.name, this.dob, this.email, this.mobile, this.address,this.image,this.shiftId,this.departmentId,[this.shifttype='morning']);
}