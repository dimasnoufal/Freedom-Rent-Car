import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/pages/admins/admin_main_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_image_picker.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import '../../../shared/theme.dart';

class AdminAddCar extends StatelessWidget {
  const AdminAddCar({
    super.key,
  });

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
                    onTextChanged: (value) {},
                  ),
                  CustomInputNoHide(
                      title: 'Tahun',
                      hintText: 'Masukan Tahun Mobil',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Rating',
                      hintText: 'Masukan Rating Mobil',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'About',
                      hintText: 'Masukan Deskripsi Mobil',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Price',
                      hintText: 'Masukan Harga Mobil',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 1',
                      hintText: 'Masukan Fitur Mobil 1',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 2',
                      hintText: 'Masukan Fitur Mobil 2',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 3',
                      hintText: 'Masukan Fitur Mobil 3',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomInputNoHide(
                      title: 'Feature 4',
                      hintText: 'Masukan Fitur Mobil 4',
                      onTextChanged: (value) {},
                      margin: EdgeInsets.only(top: 20)),
                  CustomImagePicker(
                    title: 'Masukan Gambar Mobil',
                    margin: EdgeInsets.only(top: 20),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminMainPage()),
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
