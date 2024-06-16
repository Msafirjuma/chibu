import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/view/splash_screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/isarcontroller.dart';
import '../../utils/appconstants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    Get.put(IsarController());
    return Container(
      decoration: backgroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Image.asset(
          appIcon,
          height: 100,
        )),
      ),
    );
  }
}
