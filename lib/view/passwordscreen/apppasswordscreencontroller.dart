import 'package:cnfaceattendance/repository/getcompanydetailsrepository.dart';
import 'package:cnfaceattendance/view/setting_screen/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/alertbox.dart';

class PasswordScreenController extends GetxController {
  var companyName = "".obs;
  var companyImage = "".obs;
  var appPassword = "".obs;

  final formKey = GlobalKey<FormState>();
  final repository = GetCompanyDetailsRepository();

  Future<void> checkPassword(String value) async {
    if (value == await repository.getpassword()) {
      Get.off(const SettingScreen());
    } else {
      showAlert(' Incorrect password');
    }
  }

  Future<void> getCompanyDetails() async {
    companyImage.value = await repository.getCompanyImage();
    companyName.value = await repository.getCompanyName();
  }

  @override
  Future<void> onInit() async {
    appPassword.value = await repository.getpassword();
    getCompanyDetails();
    super.onInit();
  }
}
