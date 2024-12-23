import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'top_cars_response.g.dart';

TopCarsResponse topCarsResponseFromJson(String str) =>
    TopCarsResponse.fromJson(json.decode(str));

String topCarsResponseToJson(TopCarsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TopCarsResponse {
  Meta meta;
  List<Datums> data;

  TopCarsResponse({
    required this.meta,
    required this.data,
  });

  factory TopCarsResponse.fromJson(Map<String, dynamic> json) =>
      TopCarsResponse(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datums>.from(json["data"].map((x) => Datums.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datums {
  int id;
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
  DateTime createdAt;
  DateTime updatedAt;

  Datums({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datums.fromJson(Map<String, dynamic> json) => Datums(
        id: json["id"],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
