import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'add_cars_response.g.dart';

AddCarsResponse addCarsResponseFromJson(String str) =>
    AddCarsResponse.fromJson(json.decode(str));

String addCarsResponseToJson(AddCarsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AddCarsResponse {
  Meta meta;
  Data data;

  AddCarsResponse({
    required this.meta,
    required this.data,
  });

  factory AddCarsResponse.fromJson(Map<String, dynamic> json) =>
      AddCarsResponse(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String codeCar;
  String image;
  String name;
  String year;
  String rating;
  String about;
  int price;
  int quantity;
  String feature1;
  String feature2;
  String feature3;
  String feature4;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.codeCar,
    required this.image,
    required this.name,
    required this.year,
    required this.rating,
    required this.about,
    required this.price,
    required this.quantity,
    required this.feature1,
    required this.feature2,
    required this.feature3,
    required this.feature4,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        codeCar: json["code_car"],
        image: json["image"],
        name: json["name"],
        year: json["year"],
        rating: json["rating"],
        about: json["about"],
        price: json["price"],
        quantity: json["quantity"],
        feature1: json["feature1"],
        feature2: json["feature2"],
        feature3: json["feature3"],
        feature4: json["feature4"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "code_car": codeCar,
        "image": image,
        "name": name,
        "year": year,
        "rating": rating,
        "about": about,
        "price": price,
        "quantity": quantity,
        "feature1": feature1,
        "feature2": feature2,
        "feature3": feature3,
        "feature4": feature4,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
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
