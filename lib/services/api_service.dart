import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/models/add_cars_response.dart';
import 'package:freedom_rent_car_app/models/all_bookings_car_response.dart';
import 'package:freedom_rent_car_app/models/all_cars_response.dart';
import 'package:freedom_rent_car_app/models/available_cars_response.dart';
import 'package:freedom_rent_car_app/models/booking_by_id_response.dart';
import 'package:freedom_rent_car_app/models/booking_cars_response.dart';
import 'package:freedom_rent_car_app/models/edit_bookings_car_response.dart';
import 'package:freedom_rent_car_app/models/edit_cars_response.dart';
import 'package:freedom_rent_car_app/models/forget_password_response.dart';
import 'package:freedom_rent_car_app/models/login_response.dart';
import 'package:freedom_rent_car_app/models/top_cars_response.dart';
import 'package:retrofit/retrofit.dart';
import '../models/register_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://15e6-139-0-162-245.ngrok-free.app/api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('register')
  Future<RegisterResponse> register(
    @Field('email') String email,
    @Field('name') String name,
    @Field('password') String password,
    @Field('phone_number') String phoneNumber,
  );

  @POST('login')
  Future<LoginResponse> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST('reset-password')
  Future<ForgetPasswordResponse> forgetPassword(
    @Field('email') String email,
    @Field('password') String password,
  );

  @GET('cars/available')
  Future<AvailableCarsResponse> getAvailableCars();

  @GET('cars/top')
  Future<TopCarsResponse> getTopCars();

  @POST('booking/add/{idMobil}/{idAkun}')
  @MultiPart()
  Future<BookingCarsResponse> postBookingCars(
    @Path('idMobil') int idMobil,
    @Path('idAkun') int idAkun,
    @Part(name: 'nama_mobil') String namaMobil,
    @Part(name: 'tahun_mobil') String tahunMobil,
    @Part(name: 'alamat') String alamat,
    @Part(name: 'tanggal_pemesanan') String tanggalPemesanan,
    @Part(name: 'tanggal_pengembalian') String tanggalPengembalian,
    @Part(name: 'nama_pemesan') String namaPemesan,
    @Part(name: 'no_hp') String noHp,
    @Part(name: 'foto_ktp') File fotoKtp,
    @Part(name: 'foto_sim') File fotoSim,
    @Part(name: 'status') String status,
    @Part(name: 'layanan_supir') String layananSupir,
    @Part(name: 'total_harga') String totalHarga,
  );

  @GET('booking/{idAkun}')
  Future<BookingByIdResponse> getBookingById(@Path('idAkun') int idAkun);

  @GET('cars')
  Future<AllCarsResponse> getAllCars();

  @POST('car/{idAkun}')
  @MultiPart()
  Future<EditCarsResponse> postEditCars(
    @Path('idAkun') int idAkun,
    @Part(name: 'image') File? image,
    @Part(name: 'name') String name,
    @Part(name: 'year') String year,
    @Part(name: 'rating') String rating,
    @Part(name: 'about') String about,
    @Part(name: 'price') String price,
    @Part(name: 'quantity') String quantity,
    @Part(name: 'feature1') String feature1,
    @Part(name: 'feature2') String feature2,
    @Part(name: 'feature3') String feature3,
    @Part(name: 'feature4') String feature4,
  );

  @POST('car/add')
  @MultiPart()
  Future<AddCarsResponse> postAddCars(
    @Part(name: 'image') File image,
    @Part(name: 'name') String name,
    @Part(name: 'year') String year,
    @Part(name: 'rating') String rating,
    @Part(name: 'about') String about,
    @Part(name: 'price') String price,
    @Part(name: 'quantity') String quantity,
    @Part(name: 'feature1') String feature1,
    @Part(name: 'feature2') String feature2,
    @Part(name: 'feature3') String feature3,
    @Part(name: 'feature4') String feature4,
  );

  @GET('booking')
  Future<AllBookingsCarResponse> getAllBookingsCar();

  @POST('booking/edit/{idBooking}')
  Future<EditBookingsCarResponse> postEditBookingsCar(
    @Path('idBooking') int idBooking,
    @Field('status') String status,
  );
}
