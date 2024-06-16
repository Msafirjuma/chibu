import 'package:cnfaceattendance/model/isarmodel/face_id_model.dart';
import 'package:cnfaceattendance/repository/getallfaceidrepository.dart';
import 'package:cnfaceattendance/repository/getcompanydetailsrepository.dart';
import 'package:cnfaceattendance/repository/logoutrepository.dart';
import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:cnfaceattendance/view/employeeregisterscreen/employeeregister_screen.dart';

import 'package:cnfaceattendance/view/login_screen/login_screen.dart';

import 'package:cnfaceattendance/view/todaysattendance/todayattendancescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/isarmodel/usermodel.dart';
import '../../repository/delete_face_id_repository.dart';
import '../../repository/deleteuserrepository.dart';
import '../../repository/getuserrepository.dart';
import '../companyprofilesetup_screen/companyprofilesetup_screen.dart';

class SettingScreenController extends GetxController {
  final LogoutRepository repository = LogoutRepository();
  final repositiory = GetUserRepositiory();
  final deleteUserrepository = DeleteUserRepository();
  final deleteFaceIDrepository = DeleteFaceIDRepository();
  final getallfaceidrepository = GetAllFaceaIdsRepository();
  final getcompanydetailsrepository = GetCompanyDetailsRepository();
  var image = ''.obs;
  var name = ''.obs;

  void logoutApi() async {
    customDilogBox(Icons.logout, 'Logout', 'Do you sure want to logout ?',
        () async {
      Get.back();
      try {
        customLoader();
         await repository.logOutApi();
        Get.back();
        clearToken();
        Get.offAll(LoginScreen());
        showAlert("Logout Successful");
      } catch (e) {
        Get.back();
        clearToken();
        Get.offAll(LoginScreen());
        showAlert(e.toString());
      }
    });
  }

  void clearToken() {
    repository.clearToken();
  }

  void goToCompanyProfileSetup() {
    Get.to(const CompanyProfileSetupScreen());
  }

  void goToEmployeeSetup() {
    Get.to(const EmployeeRegisterScreen());
  }

  void goToTodayAttendancePage() {
    Get.to(const TodayAttendanceScreen());
  }

  Future<void> getUserListFromApi() async {
    try {
      customLoader();

      var response = await repositiory.getUserListFromApi();
      deleteUserrepository.deleteAlluser();

      var users = <User>[];
      for (var data in response!.data) {
        users.add(User(data.id, data.name, data.dob, data.email, data.mobile,
            data.address, data.image, int.parse(data.shiftId), int.parse(data.departmentId),data.shifttype,));
      }
      repositiory.createAlluser(users);

      var faceids = <FaceIdModel>[];
      var getallfaceidsresponse =
          await getallfaceidrepository.getallFaceIDFromApi();
      deleteFaceIDrepository.deleteAllFaceIds();

      for (var data in getallfaceidsresponse.data) {
        faceids.add(FaceIdModel(int.parse(data.userId), data.data));
      }
      getallfaceidrepository.createAllFaceIDs(faceids);

      Get.back();
      showAlert("Data Synced successfully");
    } catch (e) {
      Get.back();
      showAlert(e.toString());
    }
  }

  Future<void> getCompanyDetails() async {

    name.value = await repository.getCompanyName();
    image.value = await repository.getCompanyImage();
  }

  @override
  void onInit() {
    getCompanyDetails();
    super.onInit();
  }
}
