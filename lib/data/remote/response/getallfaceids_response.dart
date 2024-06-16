// To parse this JSON data, do
//
//     final getAllFaceIsResponse = getAllFaceIsResponseFromJson(jsonString);

import 'dart:convert';

GetAllFaceIsResponse getAllFaceIsResponseFromJson(String str) => GetAllFaceIsResponse.fromJson(json.decode(str));

String getAllFaceIsResponseToJson(GetAllFaceIsResponse data) => json.encode(data.toJson());

class GetAllFaceIsResponse {
  int status;
  int statusCode;
  String message;
  List<Datum> data;

  GetAllFaceIsResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory GetAllFaceIsResponse.fromJson(Map<String, dynamic> json) => GetAllFaceIsResponse(
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
  String data;
  String userId;

  Datum({
    required this.data,
    required this.userId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    data: json["data"],
    userId: json["user_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "user_id": userId,
  };
}
