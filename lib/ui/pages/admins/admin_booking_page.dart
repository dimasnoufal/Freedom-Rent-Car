import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/models/all_bookings_car_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';

import 'package:freedom_rent_car_app/ui/pages/admins/admin_edit_booking_car.dart';
import 'package:freedom_rent_car_app/ui/widgets/rent_car_tile_book.dart';
import '../../../shared/theme.dart';

class AdminBookingPage extends StatefulWidget {
  const AdminBookingPage({super.key});

  @override
  State<AdminBookingPage> createState() => _AdminBookingPageState();
}

class _AdminBookingPageState extends State<AdminBookingPage> {
  late ApiService _apiService;
  List<Datumzz> allBookingsCar = [];

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

    handleGetAllBookingsCar();
  }

  void handleGetAllBookingsCar() async {
    try {
      AllBookingsCarResponse response = await _apiService.getAllBookingsCar();
      print(response.meta.message);

      setState(() {
        allBookingsCar = response.data;
        print(allBookingsCar);
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Fetch Data Berhasil'),
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );
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
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Booking Page',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 30, left: defaultMargin, right: defaultMargin),
                  child: Column(
                    children: [
                      ...allBookingsCar
                          .map((car) => RentCarTileBook(
                                name: car.namaMobil,
                                year: car.tahunMobil,
                                status: car.status,
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AdminEditBookingCar(
                                      bookingId: car.id,
                                      name: car.namaMobil,
                                      year: car.tahunMobil,
                                      status: car.status,
                                    );
                                  }));
                                },
                              ))
                          .toList(),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
