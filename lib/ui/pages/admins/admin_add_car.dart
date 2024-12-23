import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/models/add_cars_response.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/pages/admins/admin_main_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_image_picker.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import '../../../shared/theme.dart';

class AdminAddCar extends StatefulWidget {
  const AdminAddCar({
    super.key,
  });

  @override
  State<AdminAddCar> createState() => _AdminAddCarState();
}

class _AdminAddCarState extends State<AdminAddCar> {
  late ApiService _apiService;
  late File image;
  late String name;
  late String year;
  late String rating;
  late String about;
  late String price;
  late String quantity;
  late String feature1;
  late String feature2;
  late String feature3;
  late String feature4;

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

  void hanleAddCars() async {
    try {
      AddCarsResponse response = await _apiService.postAddCars(
        image,
        name,
        year,
        rating,
        about,
        price,
        quantity,
        feature1,
        feature2,
        feature3,
        feature4,
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
                    title: 'Nama',
                    hintText: 'Masukan Nama Mobil',
                    onTextChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  CustomInputNoHide(
                      title: 'Tahun',
                      hintText: 'Masukan Tahun Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          year = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Rating',
                      hintText: 'Masukan Rating Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'About',
                      hintText: 'Masukan Deskripsi Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          about = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Price',
                      hintText: 'Masukan Harga Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          price = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Quantity',
                      hintText: 'Masukan Quantity Mobil',
                      onTextChanged: (value) {
                        setState(() {
                          quantity = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 1',
                      hintText: 'Masukan Fitur Mobil 1',
                      onTextChanged: (value) {
                        setState(() {
                          feature1 = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 2',
                      hintText: 'Masukan Fitur Mobil 2',
                      onTextChanged: (value) {
                        setState(() {
                          feature2 = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 3',
                      hintText: 'Masukan Fitur Mobil 3',
                      onTextChanged: (value) {
                        setState(() {
                          feature3 = value;
                        });
                      },
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 4',
                      hintText: 'Masukan Fitur Mobil 4',
                      onTextChanged: (value) {
                        setState(() {
                          feature4 = value;
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
                text: 'Tambah Informasi Mobil',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Container(
                          width: double.infinity,
                          child: Text(
                            'Konfirmasi Penambahan',
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
                                  'Apakah anda yakin ingin menambah mobil ini?'),
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
                                  hanleAddCars();
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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Tambah Mobil',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              content(context),
            ],
          ),
        ),
      ),
    );
  }
}
