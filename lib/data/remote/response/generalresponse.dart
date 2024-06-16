import 'dart:convert';

GeneralResponse generalResponseFromJson(String str) =>
    GeneralResponse.fromJson(json.decode(str));

String generalResponseToJson(GeneralResponse data) =>
    json.encode(data.toJson());

class GeneralResponse {
  int status;
  int statusCode;
  String message;

  GeneralResponse({
    required this.status,
    required this.statusCode,
    required this.message,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      GeneralResponse(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
      };
}
