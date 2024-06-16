// To parse this JSON data, do
//
//     final updateUserResponse = updateUserResponseFromJson(jsonString);

import 'dart:convert';

UpdateUserResponse updateUserResponseFromJson(String str) => UpdateUserResponse.fromJson(json.decode(str));

String updateUserResponseToJson(UpdateUserResponse data) => json.encode(data.toJson());

class UpdateUserResponse {
  int status;
  int statusCode;
  String message;
  Data data;

  UpdateUserResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) => UpdateUserResponse(
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
  String name;
  DateTime dob;
  String email;
  String mobile;
  String address;

  Data({
    required this.name,
    required this.dob,
    required this.email,
    required this.mobile,
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    dob: DateTime.parse(json["dob"]),
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "email": email,
    "mobile": mobile,
    "address": address,
  };
}
