// To parse this JSON data, do
//
//     final todaysAttendanceResponse = todaysAttendanceResponseFromJson(jsonString);

import 'dart:convert';

TodaysAttendanceResponse todaysAttendanceResponseFromJson(String str) => TodaysAttendanceResponse.fromJson(json.decode(str));

String todaysAttendanceResponseToJson(TodaysAttendanceResponse data) => json.encode(data.toJson());

class TodaysAttendanceResponse {
  int status;
  int statusCode;
  String message;
  List<Datum> data;

  TodaysAttendanceResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TodaysAttendanceResponse.fromJson(Map<String, dynamic> json) => TodaysAttendanceResponse(
    status: json["status"],
    statusCode: json["status_code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String userId;
  String name;
  DateTime date;
  String checkIn;
  String checkOut;
  String lunchIn;
  String lunchOut;
  String checkInImage;
  String checkOutImage;
  String lunchInImage;
  String lunchOutImage;
  String isOnLeave;
  String attendanceId;
  String shiftType;

  Datum({
    required this.userId,
    required this.name,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.lunchIn,
    required this.lunchOut,
    required this.checkInImage,
    required this.checkOutImage,
    required this.lunchInImage,
    required this.lunchOutImage,
    required this.isOnLeave,
    required this.attendanceId,
    required this.shiftType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userId: json["user_id"].toString(),
    name: json["name"],
    date: DateTime.parse(json["date"]),
    checkIn: json["check_in"],
    checkOut: json["check_out"],
    lunchIn: json["lunch_in"],
    lunchOut: json["lunch_out"],
    checkInImage: json["check_in_image"],
    checkOutImage: json["check_out_image"],
    lunchInImage: json["lunch_in_image"],
    lunchOutImage: json["lunch_out_image"],
    isOnLeave: json["is_on_leave"].toString(),
    attendanceId: json["attendance_id"].toString(),
    shiftType: json["shift_type"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "check_in": checkIn,
    "check_out": checkOut,
    "lunch_in": lunchIn,
    "lunch_out": lunchOut,
    "check_in_image": checkInImage,
    "check_out_image": checkOutImage,
    "lunch_in_image": lunchInImage,
    "lunch_out_image": lunchOutImage,
    "is_on_leave": isOnLeave,
    "attendance_id": attendanceId,
    "shift_type": shiftType,
  };
}
