import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response.g.dart';

ForgetPasswordResponse forgetPasswordResponseFromJson(String str) =>
    ForgetPasswordResponse.fromJson(json.decode(str));

String forgetPasswordResponseToJson(ForgetPasswordResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ForgetPasswordResponse {
  Meta meta;
  dynamic data;

  ForgetPasswordResponse({
    required this.meta,
    required this.data,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordResponse(
        meta: Meta.fromJson(json["meta"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data,
      };
}

class Meta {
  int code;
  String status;
  String message;

  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
