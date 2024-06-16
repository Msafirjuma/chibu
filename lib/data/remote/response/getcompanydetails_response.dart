// To parse this JSON data, do
//
//     final getCompanyDetailsResponse = getCompanyDetailsResponseFromJson(jsonString);

import 'dart:convert';

GetCompanyDetailsResponse getCompanyDetailsResponseFromJson(String str) => GetCompanyDetailsResponse.fromJson(json.decode(str));

String getCompanyDetailsResponseToJson(GetCompanyDetailsResponse data) => json.encode(data.toJson());

class GetCompanyDetailsResponse {
  int status;
  int statusCode;
  String message;
  Data data;

  GetCompanyDetailsResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory GetCompanyDetailsResponse.fromJson(Map<String, dynamic> json) => GetCompanyDetailsResponse(
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
  String primaryEmail;
  String secondaryEmail;
  String primaryContactNo;
  String secondaryContactNo;
  String address;
  String image;
  String websiteUrl;

  Data({
    required this.name,
    required this.primaryEmail,
    required this.secondaryEmail,
    required this.primaryContactNo,
    required this.secondaryContactNo,
    required this.address,
    required this.image,
    required this.websiteUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    primaryEmail: json["primary_email"],
    secondaryEmail: json["secondary_email"],
    primaryContactNo: json["primary_contact_no"],
    secondaryContactNo: json["secondary_contact_no"],
    address: json["address"],
    image: json["image"],
    websiteUrl: json["website_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "primary_email": primaryEmail,
    "secondary_email": secondaryEmail,
    "primary_contact_no": primaryContactNo,
    "secondary_contact_no": secondaryContactNo,
    "address": address,
    "image": image,
    "website_url": websiteUrl,
  };
}
