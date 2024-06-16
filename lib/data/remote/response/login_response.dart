
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int status;
  int statusCode;
  String message;
  Data data;

  LoginResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
  String token;
  String appPassword;
  Data({
    required this.token,
    required this.appPassword
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"]??"",
    appPassword: json["app_password"]??""
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
