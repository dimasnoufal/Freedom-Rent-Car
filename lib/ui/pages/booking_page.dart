import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/widgets/rent_car_tile_book.dart';
import '../../shared/theme.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

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
                      RentCarTileBook(
                          name: 'Avanza',
                          year: '2020',
                          imageUrl: 'assets/logo_no_bg.png',
                          onTap: () {}),
                      RentCarTileBook(
                          name: 'Avanza',
                          year: '2020',
                          imageUrl: 'assets/logo_no_bg.png',
                          onTap: () {}),
                      RentCarTileBook(
                          name: 'Avanza',
                          year: '2020',
                          imageUrl: 'assets/logo_no_bg.png',
                          onTap: () {}),
                      RentCarTileBook(
                          name: 'Avanza',
                          year: '2020',
                          imageUrl: 'assets/logo_no_bg.png',
                          onTap: () {}),
                      RentCarTileBook(
                          name: 'Avanza',
                          year: '2020',
                          imageUrl: 'assets/logo_no_bg.png',
                          onTap: () {}),
                      RentCarTileBook(
                          name: 'Avanza',
                          year: '2020',
                          imageUrl: 'assets/logo_no_bg.png',
                          onTap: () {}),
                      RentCarTileBook(
                          name: 'Avanza',
                          year: '2020',
                          imageUrl: 'assets/logo_no_bg.png',
                          onTap: () {}),
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
