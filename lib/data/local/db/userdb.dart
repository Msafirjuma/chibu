import 'package:cnfaceattendance/controller/isarcontroller.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../model/isarmodel/usermodel.dart';

class UserDb {
  final IsarController model = Get.find();

  void createUser(User user) async {
    await model.isar.writeTxn(() async {
      await model.isar.users.put(user);


    });
  }

  void createAlluser(List<User>user)async{
    await model.isar.writeTxn(()async {
      await model.isar.users.putAll(user);
    });
  }

  Future<List<User>> getAlluser() async {
    return await model.isar.users.where().findAll();
  }

  Future<User?> getUserFromuserId(int userID) async {
    return await model.isar.users.filter().userIdEqualTo(userID).findFirst();
  }

  Query<User> queryForAlluser() {
    return model.isar.users.where().build();
  }
  void deleteAll() async {
    model.isar.writeTxn(
          () async {
        await model.isar.users.where().deleteAll();
      },
    );
  }
  void deleteUserById(int userid) async {
    model.isar.writeTxn(
          () async {
        await model.isar.users.filter().userIdEqualTo(userid).deleteFirst();
      },
    );
  }
}
