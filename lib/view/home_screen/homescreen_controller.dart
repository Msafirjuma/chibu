import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:cnfaceattendance/view/attendancescreen/attendancescreen.dart';
import 'package:cnfaceattendance/view/holidayscreen/holiday_screen.dart';
import 'package:cnfaceattendance/view/home_screen/widget/homescreenwidget.dart';
import 'package:cnfaceattendance/view/notifications_screen/notification_screen.dart';
import 'package:cnfaceattendance/view/passwordscreen/apppasswordsscreen.dart';
import 'package:cnfaceattendance/view/setting_screen/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/dashboardrepository.dart';

class HomeScreenController extends SuperController {
  final repository = DashboardRepository();
  var noticeString = "".obs;
  var bannerImage = "".obs;
  var bannerUrl = "".obs;
  var companyName = "".obs;
  var companyAddress = "".obs;
  var companyImage = "".obs;

  final controller = ScrollController();

  @override
  Future<void> onInit() async {
    controller.addListener(loadmore);

    companyName.value = await repository.getCompanyName();
    companyAddress.value = await repository.getAddress();
    companyImage.value = await repository.getCompanyImage();

    getDashboardFromApi();
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void loadmore() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      getDashboardFromApi();
    }
  }

  Future<void> checkPassword() async {
    Get.to(await repository.getCheckPassword() == true
        ? PasswordScreen()
        : const SettingScreen());
  }

  RxInt bottomNavIndex = 1.obs;

  final pages = [
    const HolidayScreen(),
    const HomeScreenWidget(),
    const NotificationScreen()
  ];

  void onCheckInClicked() {
    Get.to(const AttendanceScreen(), arguments: {"mode": 0});
  }

  void onCheckOutClicked() {
    Get.to(const AttendanceScreen(), arguments: {"mode": 1});
  }

  void onBreakInClicked() {
    Get.to(const AttendanceScreen(), arguments: {"mode": 2});
  }

  void onBreakOutClicked() {
    Get.to(const AttendanceScreen(), arguments: {"mode": 3});
  }

  void goToSettingScreen() {
    Get.to(const SettingScreen());
  }

  void goToPasswordScreen() {
    Get.to(PasswordScreen());
  }

  void goToNotificationScreen() {
    Get.to(const NotificationScreen());
  }

  void goToHolidayScreen() {
    Get.to(const HolidayScreen());
  }

  Future<void> getDashboardFromApi() async {
    try {
      var response = await repository.dashBoardFromApi();
      noticeString.value = response.data.noticeBirthday.trim();
      bannerImage.value = response.data.bannerImage;
      companyName.value = response.data.companyDetail.name;
      companyAddress.value = response.data.companyDetail.address;
      companyImage.value = response.data.companyDetail.image;
      bannerUrl.value = response.data.bannerurl;
      repository
          .saveCheckPassword(response.data.checkPassword == "0" ? false : true);
      repository.saveAppPassword(response.data.appPassword);
      repository.saveCompanyDetail(
          response.data.companyDetail.name,
          response.data.companyDetail.address,
          response.data.companyDetail.image);
    } catch (e) {
      showAlert(e.toString());
    }
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
   getDashboardFromApi();
  }
}
