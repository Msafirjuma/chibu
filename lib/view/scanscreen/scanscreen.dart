
import 'package:cnfaceattendance/view/scanscreen/scanpersoncontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Get.put(ScanPersonController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(
              () => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: model.status.value == 1
                      ? Lottie.asset('assets/raw/confirm.json',repeat: false)
                      : model.status.value == 2
                      ? Lottie.asset('assets/raw/error.json',repeat: true)
                      : const SizedBox.shrink(),
                ),
                Obx(() =>  Text(model.person.value,style: const TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
