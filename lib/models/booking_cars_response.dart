import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'booking_cars_response.g.dart';

BookingCarsResponse bookingCarsResponseFromJson(String str) =>
    BookingCarsResponse.fromJson(json.decode(str));

String bookingCarsResponseToJson(BookingCarsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BookingCarsResponse {
  Meta meta;
  Data data;

  BookingCarsResponse({
    required this.meta,
    required this.data,
  });

  factory BookingCarsResponse.fromJson(Map<String, dynamic> json) =>
      BookingCarsResponse(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Booking booking;
  Car car;
  Account account;

  Data({
    required this.booking,
    required this.car,
    required this.account,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        booking: Booking.fromJson(json["booking"]),
        car: Car.fromJson(json["car"]),
        account: Account.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "booking": booking.toJson(),
        "car": car.toJson(),
        "account": account.toJson(),
      };
}

class Account {
  int id;
  String name;
  String email;
  String phoneNumber;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  Account({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Booking {
  int accountId;
  int carId;
  String namaMobil;
  String tahunMobil;
  String alamat;
  String tanggalPemesanan;
  String tanggalPengembalian;
  String namaPemesan;
  String noHp;
  String fotoKtp;
  String fotoSim;
  String status;
  String layananSupir;
  String totalHarga;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Booking({
    required this.accountId,
    required this.carId,
    required this.namaMobil,
    required this.tahunMobil,
    required this.alamat,
    required this.tanggalPemesanan,
    required this.tanggalPengembalian,
    required this.namaPemesan,
    required this.noHp,
    required this.fotoKtp,
    required this.fotoSim,
    required this.status,
    required this.layananSupir,
    required this.totalHarga,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        accountId: json["account_id"],
        carId: json["car_id"],
        namaMobil: json["nama_mobil"],
        tahunMobil: json["tahun_mobil"],
        alamat: json["alamat"],
        tanggalPemesanan: json["tanggal_pemesanan"],
        tanggalPengembalian: json["tanggal_pengembalian"],
        namaPemesan: json["nama_pemesan"],
        noHp: json["no_hp"],
        fotoKtp: json["foto_ktp"],
        fotoSim: json["foto_sim"],
        status: json["status"],
        layananSupir: json["layanan_supir"],
        totalHarga: json["total_harga"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "car_id": carId,
        "nama_mobil": namaMobil,
        "tahun_mobil": tahunMobil,
        "alamat": alamat,
        "tanggal_pemesanan": tanggalPemesanan,
        "tanggal_pengembalian": tanggalPengembalian,
        "nama_pemesan": namaPemesan,
        "no_hp": noHp,
        "foto_ktp": fotoKtp,
        "foto_sim": fotoSim,
        "status": status,
        "layanan_supir": layananSupir,
        "total_harga": totalHarga,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}

class Car {
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

  Car({
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

  factory Car.fromJson(Map<String, dynamic> json) => Car(
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
