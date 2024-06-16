// To parse this JSON data, do
//
//     final saveEmployeeAttendanceResponse = saveEmployeeAttendanceResponseFromJson(jsonString);

import 'dart:convert';

SaveEmployeeAttendanceResponse saveEmployeeAttendanceResponseFromJson(String str) => SaveEmployeeAttendanceResponse.fromJson(json.decode(str));

String saveEmployeeAttendanceResponseToJson(SaveEmployeeAttendanceResponse data) => json.encode(data.toJson());

class SaveEmployeeAttendanceResponse {
  int status;
  int statusCode;
  String message;
  Data data;

  SaveEmployeeAttendanceResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SaveEmployeeAttendanceResponse.fromJson(Map<String, dynamic> json) => SaveEmployeeAttendanceResponse(
    status: json["status"],
    statusCode: json["status_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_code": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String checkIn;
  String checkInImage;
  String checkOut;
  String checkOutImage;
  String lunchIn;
  String lunchInImage;
  String lunchOut;
  String lunchOutImage;

  Data({
    required this.checkIn,
    required this.checkInImage,
    required this.checkOut,
    required this.checkOutImage,
    required this.lunchIn,
    required this.lunchInImage,
    required this.lunchOut,
    required this.lunchOutImage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    checkIn: json["check_in"],
    checkInImage: json["check_in_image"],
    checkOut: json["check_out"],
    checkOutImage: json["check_out_image"],
    lunchIn: json["lunch_in"],
    lunchInImage: json["lunch_in_image"],
    lunchOut: json["lunch_out"],
    lunchOutImage: json["lunch_out_image"],
  );

  Map<String, dynamic> toJson() => {
    "check_in": checkIn,
    "check_in_image": checkInImage,
    "check_out": checkOut,
    "check_out_image": checkOutImage,
    "lunch_in": lunchIn,
    "lunch_in_image": lunchInImage,
    "lunch_out": lunchOut,
    "lunch_out_image": lunchOutImage,
  };
}
