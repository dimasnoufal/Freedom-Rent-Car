import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'edit_bookings_car_response.g.dart';

EditBookingsCarResponse editBookingsCarResponseFromJson(String str) =>
    EditBookingsCarResponse.fromJson(json.decode(str));

String editBookingsCarResponseToJson(EditBookingsCarResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class EditBookingsCarResponse {
  Meta meta;
  Data data;

  EditBookingsCarResponse({
    required this.meta,
    required this.data,
  });

  factory EditBookingsCarResponse.fromJson(Map<String, dynamic> json) =>
      EditBookingsCarResponse(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  int id;
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
  int totalHarga;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
