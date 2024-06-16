import 'dart:convert';

FaceIdResponse faceIdResponseFromJson(String str) =>
    FaceIdResponse.fromJson(json.decode(str));

String faceIdResponseToJson(FaceIdResponse data) => json.encode(data.toJson());

class FaceIdResponse {
  int status;
  int statusCode;
  String message;
  Data data;

  FaceIdResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory FaceIdResponse.fromJson(Map<String, dynamic> json) => FaceIdResponse(
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
  String data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
