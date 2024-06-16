import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/utils/customborderradius.dart';
import 'package:cnfaceattendance/view/todaysattendance/todaysattendancecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayAttendanceScreen extends StatelessWidget {
  const TodayAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Get.put(TodayAttendanceController());
    return Container(
      decoration: backgroundDecoration(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Today\'s Attendadnce',
          ),
          elevation: 0,
        ),
        body: Obx(
          () => RefreshIndicator(
            onRefresh: () async {
              await model.getTodayAttendaceFromApi();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: ListView.builder(
                  itemCount: model.todaysAttendancelist.length,
                  itemBuilder: (BuildContext context, index) {
                    final attendance = model.todaysAttendancelist[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(),
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  attendance.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                attendance.isOnLeave == '0'
                                    ? Container()
                                    : const Text(
                                        '(On leave)',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(),
                            color: Colors.white12,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (attendance.checkInImage !="") {
                                      customDilogBoxForAttendance(
                                          'Check in', attendance.checkInImage);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Check in',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        attendance.checkIn,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.white24,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (attendance.lunchInImage !="") {
                                      customDilogBoxForAttendance(
                                          'Lunch in', attendance.lunchInImage);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Lunch in',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        attendance.lunchIn,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.white24,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (attendance.lunchOutImage !="") {
                                      customDilogBoxForAttendance(
                                          'Lunch out', attendance.lunchOutImage);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Lunch out',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        attendance.lunchOut,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.white24,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (attendance.checkOutImage !="") {
                                      customDilogBoxForAttendance(
                                          'Check out', attendance.checkOutImage);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Check out',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        attendance.checkOut,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
