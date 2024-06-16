import 'dart:async';

import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/view/home_screen/home_screen.dart';
import 'package:cnfaceattendance/view/login_screen/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final Preferences perferences = Preferences();

  @override
  void onInit() {
    goToNextPage();

    super.onInit();
  }

  void goToNextPage() async {
    var token = await perferences.getToken();

    Timer(
        const Duration(seconds: 1),
        () => Get.offAll(token.isEmpty ? LoginScreen() : const HomeScreen(),
            transition: Transition.fade, duration: const Duration(seconds: 2)));
  }
}
