import 'package:cnfaceattendance/model/today_attendanc_emodel.dart';
import 'package:cnfaceattendance/repository/todayattendancerepository.dart';
import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TodayAttendanceController extends GetxController {
  final repository = TodayAttendanceRepository();
  final todaysAttendancelist = <TodayAttendance>[].obs;

  Future<void> getTodayAttendaceFromApi() async {
    try {
      customLoader();
      var response = await repository.getTodaysAttendaceFromApi();
      Get.back();
      final attendancelist = <TodayAttendance>[];
      for (var data in response.data) {
        final attendance = TodayAttendance(
            data.userId,
            data.name,
            data.date,
            data.checkIn,
            data.checkOut,
            data.lunchIn,
            data.lunchOut,
            data.isOnLeave,
            data.checkInImage,
            data.checkOutImage,
            data.lunchInImage,
            data.lunchOutImage,
            data.attendanceId,
            data.shiftType);
        if (attendance.checkIn != '-' && attendance.shifttype != 'night') {
          final value = DateFormat('yyyy-MM-dd hh:mm:ss')
              .parse(attendance.checkIn);
          attendance.checkIn = DateFormat("hh:mm:ss a").format(value);
        }
        if (attendance.checkOut != '-' && attendance.shifttype!='night') {
         final value=
              DateFormat('yyyy-MM-dd hh:mm:ss')
                  .parse(attendance.checkOut);
         attendance.checkOut=DateFormat("hh:mm:ss a").format(value);

        }
        if (attendance.lunchIn != '-' && attendance.shifttype!= 'night') {
          final value=
          DateFormat('yyyy-MM-dd hh:mm:ss')
              .parse(attendance.lunchIn);
          attendance.lunchIn=DateFormat("hh:mm:ss a").format(value);
        }
        if (attendance.lunchOut != '-' && attendance.shifttype!= 'night') {
          final value=
          DateFormat('yyyy-MM-dd hh:mm:ss')
              .parse(attendance.lunchOut);
          attendance.lunchOut=DateFormat("hh:mm:ss a").format(value);
        }

        attendancelist.add(attendance);
      }
      todaysAttendancelist.value = attendancelist;
    } catch (e) {
      showAlert(e.toString());
      Get.back();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getTodayAttendaceFromApi();
  }
}
