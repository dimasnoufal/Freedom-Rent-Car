import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/models/booking_by_id_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';

import 'package:freedom_rent_car_app/ui/widgets/rent_car_tile_book.dart';
import '../../shared/theme.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late ApiService _apiService;
  List<Datumss> listBookingById = [];

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

    handleGetBookingById();
  }

  void handleGetBookingById() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id') ?? 0;
      BookingByIdResponse response = await _apiService.getBookingById(id);
      print(response.meta.message);

      setState(() {
        listBookingById = response.data;
        print(listBookingById);
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
                      ...listBookingById
                          .map((booking) => RentCarTileBook(
                                name: booking.namaMobil,
                                year: booking.tahunMobil,
                                status: booking.status,
                                onTap: () {},
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
