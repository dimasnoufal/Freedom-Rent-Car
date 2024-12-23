import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/models/edit_cars_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';

import 'package:freedom_rent_car_app/ui/pages/admins/admin_main_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_image_picker.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import '../../../shared/theme.dart';

class AdminEditCar extends StatefulWidget {
  final int carId;
  final String name;
  final String year;
  final String imageUrl;
  final double rating;
  final String about;
  final int price;
  final int quantity;
  final String feature1;
  final String feature2;
  final String feature3;
  final String feature4;
  const AdminEditCar({
    super.key,
    required this.carId,
    required this.name,
    required this.year,
    required this.imageUrl,
    required this.rating,
    required this.about,
    required this.price,
    required this.quantity,
    this.feature1 = '',
    this.feature2 = '',
    this.feature3 = '',
    this.feature4 = '',
  });

  @override
  State<AdminEditCar> createState() => _AdminEditCarState();
}

class _AdminEditCarState extends State<AdminEditCar> {
  late ApiService _apiService;
  File? image;
  String? name;
  String? year;
  String? rating;
  String? about;
  String? price;
  String? quantity;
  String? feature1;
  String? feature2;
  String? feature3;
  String? feature4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeApiService();
  }

  Future<void> _initializeApiService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    print(token);

    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    _apiService = ApiService(dio);
  }

  void hanleEditCars() async {
    try {
      int idMobil = widget.carId;

      print(idMobil);

      EditCarsResponse response = await _apiService.postEditCars(
        idMobil,
        image,
        name ?? widget.name,
        year ?? widget.year,
        rating ?? widget.rating.toString(),
        about ?? widget.about,
        price ?? widget.price.toString(),
        quantity ?? widget.quantity.toString(),
        feature1 ?? widget.feature1,
        feature2 ?? widget.feature2,
        feature3 ?? widget.feature3,
        feature4 ?? widget.feature4,
      );

      String responseMessage = response.meta.message;

      Navigator.pushNamed(context, '/admin-main');

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
            // Note: Form
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 320),
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
                    title: 'Nama',
                    hintText: 'Masukan Nama Mobil',
                    onTextChanged: (value) {
                      setState(() {
                        name = value ?? widget.name;
                      });
                    },
                  ),
                  CustomInputNoHide(
                      title: 'Tahun',
                      hintText: 'Masukan Tahun Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          year = value ?? widget.year;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Rating',
                      hintText: 'Masukan Rating Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          rating = value ?? widget.rating.toString();
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'About',
                      hintText: 'Masukan Deskripsi Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          about = value ?? widget.about;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Price',
                      hintText: 'Masukan Harga Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          price = value ?? widget.price.toString();
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Quantity',
                      hintText: 'Masukan Quantity Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          quantity = value ?? widget.quantity.toString();
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 1',
                      hintText: 'Masukan Fitur Mobil 1',
                      onTextChanged: (value) {
                        setState(() {
                          feature1 = value ?? widget.feature1;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 2',
                      hintText: 'Masukan Fitur Mobil 2',
                      onTextChanged: (value) {
                        setState(() {
                          feature2 = value ?? widget.feature2;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 3',
                      hintText: 'Masukan Fitur Mobil 3',
                      onTextChanged: (value) {
                        setState(() {
                          feature3 = value ?? widget.feature3;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 4',
                      hintText: 'Masukan Fitur Mobil 4',
                      onTextChanged: (value) {
                        setState(() {
                          feature4 = value ?? widget.feature4;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomImagePicker(
                    title: 'Masukan Gambar Mobil',
                    margin: EdgeInsets.only(top: 20),
                    onImagePicked: (value) {
                      setState(() {
                        image = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Note: Price & Book Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20),
              // Note: Book Button
              child: CustomButton(
                text: 'Edit Informasi Mobil',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Container(
                          width: double.infinity,
                          child: Text(
                            'Konfirmasi Pengeditan',
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
                                  'Apakah anda yakin ingin mengedit mobil ini?'),
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
                                  hanleEditCars();
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
