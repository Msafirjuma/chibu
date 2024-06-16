import 'dart:convert';

ShiftResponse shiftResponseFromJson(String str) =>
    ShiftResponse.fromJson(json.decode(str));

String shiftResponseToJson(ShiftResponse data) => json.encode(data.toJson());

class ShiftResponse {
  int status;
  int statusCode;
  String message;
  List<Datum> data;

  ShiftResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ShiftResponse.fromJson(Map<String, dynamic> json) => ShiftResponse(
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
