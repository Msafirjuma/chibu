// To parse this JSON data, do
//
//     final getDepartmentResponse = getDepartmentResponseFromJson(jsonString);

import 'dart:convert';

GetDepartmentResponse getDepartmentResponseFromJson(String str) => GetDepartmentResponse.fromJson(json.decode(str));

String getDepartmentResponseToJson(GetDepartmentResponse data) => json.encode(data.toJson());

class GetDepartmentResponse {
  int status;
  int statusCode;
  String message;
  List<Datum> data;

  GetDepartmentResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory GetDepartmentResponse.fromJson(Map<String, dynamic> json) => GetDepartmentResponse(
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
  int id;
  String title;

  Datum({
    required this.id,
    required this.title,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
