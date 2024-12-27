import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:freedom_rent_car_app/models/booking_cars_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';

import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_date_time.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_image_picker.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_radio_button.dart';
import '../../shared/theme.dart';

class BookRentCar extends StatefulWidget {
  final int carId;
  final String name;
  final String year;
  final String imageUrl;
  final double rating;
  final String about;
  final double price;
  const BookRentCar({
    super.key,
    required this.carId,
    required this.name,
    required this.year,
    required this.imageUrl,
    required this.rating,
    required this.about,
    required this.price,
  });

  @override
  State<BookRentCar> createState() => _BookRentCarState();
}

class _BookRentCarState extends State<BookRentCar> {
  late ApiService _apiService;
  late String alamat;
  late String tanggalPeminjaman = '';
  late String tanggalPengembalian = '';
  late String namaPemesan;
  late String noHp;
  late File fotoKtp;
  late File fotoSim;
  late String layananSupir = 'Tidak';
  late String totalHarga;
  late String currencyTotalHargaIDR;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeApiService();
    handleCurrencyTotalPriceIDR();
  }

  void handleCurrencyTotalPriceIDR() {
    final priceIDR = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(widget.price);

    setState(() {
      currencyTotalHargaIDR = priceIDR;
    });
  }

  void handleChangeCurrencyTotalPriceIDR() {
    if (tanggalPeminjaman.isEmpty || tanggalPengembalian.isEmpty) {
      return;
    }

    DateTime startDate =
        DateFormat('yyyy-MM-dd HH:mm').parse(tanggalPeminjaman);
    DateTime endDate =
        DateFormat('yyyy-MM-dd HH:mm').parse(tanggalPengembalian);
    int days = endDate.difference(startDate).inDays;

    if (days < 1) {
      days = 1;
    }

    double totalPrice = widget.price * days;

    if (layananSupir == 'Ya') {
      totalPrice += 500000;
    }

    final priceIDR = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(totalPrice);

    setState(() {
      totalHarga = totalPrice.toString();
      currencyTotalHargaIDR = priceIDR;
    });
  }

  Future<void> _initializeApiService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    print(token);

    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    _apiService = ApiService(dio);
  }

  void handlePostBookingCars() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id') ?? 0;
      int idMobil = widget.carId;
      int idAkun = id;

      print(idMobil);
      print(idAkun);

      BookingCarsResponse response = await _apiService.postBookingCars(
        idMobil,
        idAkun,
        widget.name,
        widget.year,
        alamat,
        tanggalPeminjaman,
        tanggalPengembalian,
        namaPemesan,
        noHp,
        fotoKtp,
        fotoSim,
        'BOOKING',
        layananSupir,
        totalHarga,
      );

      String responseMessage = response.meta.message;

      Navigator.pushNamed(context, '/main');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$responseMessage'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content(BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Note: Title
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.year,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon_star.png',
                        width: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        widget.rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Note: Form
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputNoHide(
                    title: 'Alamat',
                    hintText: 'Masukan Alamat Pengantaran',
                    onTextChanged: (value) {
                      setState(() {
                        alamat = value;
                      });
                    },
                  ),
                  CustomDateTime(
                    title: 'Tanggal Peminjaman',
                    hintText1: 'Masukan Tanggal Peminjaman',
                    hintText2: 'Masukan Jam Peminjaman',
                    margin: EdgeInsets.only(top: 20),
                    onTextChanged: (value) {
                      setState(() {
                        tanggalPeminjaman = value;
                        handleChangeCurrencyTotalPriceIDR();
                      });
                    },
                  ),
                  CustomDateTime(
                    title: 'Tanggal Pengembalian',
                    hintText1: 'Masukan Tanggal Pengembalian',
                    hintText2: 'Masukan Jam Pengembalian',
                    margin: EdgeInsets.only(top: 20),
                    onTextChanged: (value) {
                      setState(() {
                        tanggalPengembalian = value;
                        handleChangeCurrencyTotalPriceIDR();
                      });
                    },
                  ),
                  CustomInputNoHide(
                      title: 'Nama Lengkap',
                      hintText: 'Masukan Nama Lengkap',
                      onTextChanged: (value) {
                        setState(() {
                          namaPemesan = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'No. Telepon',
                      hintText: 'Masukan No. Telepon',
                      onTextChanged: (value) {
                        setState(() {
                          noHp = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomImagePicker(
                    title: 'Masukan Foto KTP',
                    margin: EdgeInsets.only(top: 20),
                    onImagePicked: (value) {
                      setState(() {
                        fotoKtp = value;
                      });
                    },
                  ),
                  CustomImagePicker(
                    title: 'Masukan Foto SIM',
                    margin: EdgeInsets.only(top: 20),
                    onImagePicked: (value) {
                      setState(() {
                        fotoSim = value;
                      });
                    },
                  ),
                  CustomRadioButton(
                      title: 'Layanan Supir',
                      options: ['Ya', 'Tidak'],
                      onChanged: (value) {
                        setState(() {
                          layananSupir = value.toString();
                          handleChangeCurrencyTotalPriceIDR();
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Text(
                          'Total Harga: ',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: light,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          currencyTotalHargaIDR,
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Note: Price & Book Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20),
              // Note: Book Button
              child: CustomButton(
                text: 'Book',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Container(
                          width: double.infinity,
                          child: Text(
                            'Konfirmasi Pemesanan',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                  'Apakah anda yakin ingin memesan mobil ini?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                                text: 'Iya',
                                widht: 200,
                                onPressed: () {
                                  handlePostBookingCars();
                                }),
                          )
                        ],
                      );
                    },
                  );
                },
                widht: double.infinity,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              backgroundImage(),
              customShadow(),
              content(context),
            ],
          ),
        ),
      ),
    );
  }
}
