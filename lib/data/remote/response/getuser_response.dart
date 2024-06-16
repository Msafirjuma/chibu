// To parse this JSON data, do
//
//     final userListResponse = userListResponseFromJson(jsonString);

import 'dart:convert';

GetUserResponse userListResponseFromJson(String str) =>
    GetUserResponse.fromJson(json.decode(str));

class GetUserResponse {
  int status;
  int statusCode;
  String message;
  List<Datum> data;

  GetUserResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      GetUserResponse(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  int id;
  String name;
  String dob;
  String email;
  String mobile;
  String address;
  String shiftId;
  String image;
  String shifttype;
  String departmentId;

  Datum(
      {required this.id,
      required this.name,
      required this.dob,
      required this.email,
      required this.mobile,
      required this.address,
      required this.shiftId,
      required this.image,
      required this.shifttype,
        required this.departmentId});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"].toString(),
        dob: json["dob"].toString(),
        email: json["email"].toString(),
        mobile: json["mobile"].toString(),
        address: json["address"].toString(),
        shiftId: json["shift_id"].toString(),
        image: json["image"].toString(),
        shifttype: json["shift_type"].toString(),
      departmentId:json['department_id'].toString()
      );
}
