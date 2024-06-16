import 'package:cnfaceattendance/view/attendancescreen/attendancecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceScreen extends StatelessWidget{
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AttendanceController());
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
        child: Container(),
      ),
    );
  }

}