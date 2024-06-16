// To parse this JSON data, do
//
//     final userCreateResponse = userCreateResponseFromJson(jsonString);

import 'dart:convert';

UserCreateResponse userCreateResponseFromJson(String str) => UserCreateResponse.fromJson(json.decode(str));

String userCreateResponseToJson(UserCreateResponse data) => json.encode(data.toJson());

class UserCreateResponse {
  int status;
  int statusCode;
  String message;
  Data data;

  UserCreateResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UserCreateResponse.fromJson(Map<String, dynamic> json) => UserCreateResponse(
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
  int userId;
  String name;
  DateTime dob;
  String email;
  String mobile;
  String address;

  Data({
    required this.userId,
    required this.name,
    required this.dob,
    required this.email,
    required this.mobile,
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    name: json["name"],
    dob: DateTime.parse(json["dob"]),
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "email": email,
    "mobile": mobile,
    "address": address,
  };
}
