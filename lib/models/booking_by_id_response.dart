import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'booking_by_id_response.g.dart';

BookingByIdResponse bookingByIdResponseFromJson(String str) =>
    BookingByIdResponse.fromJson(json.decode(str));

String bookingByIdResponseToJson(BookingByIdResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BookingByIdResponse {
  Meta meta;
  List<Datumss> data;

  BookingByIdResponse({
    required this.meta,
    required this.data,
  });

  factory BookingByIdResponse.fromJson(Map<String, dynamic> json) =>
      BookingByIdResponse(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datumss>.from(json["data"].map((x) => Datumss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datumss {
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

  Datumss({
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

  factory Datumss.fromJson(Map<String, dynamic> json) => Datumss(
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
