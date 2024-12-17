import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/pages/home_page.dart';
import 'package:freedom_rent_car_app/ui/pages/main_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_date_time.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_image_picker.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_radio_button.dart';
import '../../shared/theme.dart';

class BookRentCar extends StatelessWidget {
  final String name;
  final String year;
  final String imageUrl;
  final double rating;
  final String about;
  final double price;
  const BookRentCar({
    super.key,
    required this.name,
    required this.year,
    required this.imageUrl,
    required this.rating,
    required this.about,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo_no_bg.png'),
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
                          name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          year,
                          style: whiteTextStyle.copyWith(
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
                        rating.toString(),
                        style: whiteTextStyle.copyWith(
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
                    onTextChanged: (value) {},
                  ),
                  CustomDateTime(
                      title: 'Tanggal Peminjaman',
                      hintText1: 'Masukan Tanggal Peminjaman',
                      hintText2: 'Masukan Jam Peminjaman',
                      margin: EdgeInsets.only(top: 20)),
                  CustomDateTime(
                      title: 'Tanggal Pengembalian',
                      hintText1: 'Masukan Tanggal Pengembalian',
                      hintText2: 'Masukan Jam Pengembalian',
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Nama Lengkap',
                      hintText: 'Masukan Nama Lengkap',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'No. Telepon',
                      hintText: 'Masukan No. Telepon',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomImagePicker(
                    title: 'Masukan Foto KTP',
                    margin: EdgeInsets.only(top: 20),
                  ),
                  CustomImagePicker(
                    title: 'Masukan Foto SIM',
                    margin: EdgeInsets.only(top: 20),
                  ),
                  CustomRadioButton(
                      title: 'Layanan Supir',
                      options: ['Ya', 'Tidak'],
                      onChanged: (value) {},
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
                          'Rp.12.000.000',
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()),
                                  );
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
