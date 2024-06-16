import 'package:cnfaceattendance/repository/loginrepository.dart';
import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:cnfaceattendance/view/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final LoginRepository repository = LoginRepository();

  void loginClicked(String email, String password) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    loginApi(email, password);
  }

  void loginApi(String email, String password) async {
    try {
      customLoader();
      var response = await repository.loginApi(email, password);
      Get.back();

      repository.saveLoginDetails(response!.data.token,response.data.appPassword);
      Get.offAll( const HomeScreen());
      showAlert("Login Successful");
    } catch (e) {
      Get.back();
      showAlert(e.toString());
    }
  }
}
