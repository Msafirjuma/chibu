import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/view/setting_screen/settingscreen_controller.dart';
import 'package:cnfaceattendance/view/setting_screen/widget/custom_text_botton_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/image.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Get.put(SettingScreenController());
    return Container(
      decoration: backgroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Settings',
              style: TextStyle(color: Colors.white,)
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image.network(
                            model.image.value,
                            errorBuilder: (context, error, stackTrace) {
                              return const CustomImage(size: 140);
                            },
                            fit: BoxFit.cover,
                            width: 140,
                            height: 140,
                          )))),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Center(
                        child: Text(
                      model.name.value != "" ? model.name.value : '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Services',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextBottonWidget(
                      icon: Icons.business,
                      title: 'Company Profile Setup',
                      callback: () {
                        model.goToCompanyProfileSetup();
                      }),
                  CustomTextBottonWidget(
                      icon: Icons.person,
                      title: 'Employee Setup/ register',
                      callback: () {
                        model.goToEmployeeSetup();
                      }),
                  CustomTextBottonWidget(
                      icon: Icons.timelapse,
                      title: 'Today\'s attendance',
                      callback: () {
                        model.goToTodayAttendancePage();
                      }),
                  CustomTextBottonWidget(
                      icon: Icons.sync,
                      title: 'Sync data',
                      callback: () {
                        model.getUserListFromApi();
                      }),
                  CustomTextBottonWidget(
                      icon: Icons.logout,
                      title: 'LogOut',
                      callback: () {
                        model.logoutApi();
                      })
                ]),
          ),
        ),
      ),
    );
  }
}
