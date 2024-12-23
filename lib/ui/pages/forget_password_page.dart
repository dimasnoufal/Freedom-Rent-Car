import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';

import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_hide.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import '../../shared/theme.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late ApiService _apiService;
  late String email;
  late String password;
  late String konfirmasiPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final dio = Dio();
    _apiService = ApiService(dio);
  }

  void handleForgetPassword() async {
    try {
      await _apiService.forgetPassword(
        email,
        password,
      );

      if (password != konfirmasiPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password dan Konfirmasi Password tidak cocok'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      Navigator.pushNamed(context, '/login');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Forget Password Berhasil'),
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
    Widget HeaderImage() {
      return Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/logo_no_bg.png'),
          ),
        ),
      );
    }

    Widget HeaderWelcomeText() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forget Password',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            Text(
              'Please enter your email address',
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
          ],
        ),
      );
    }

    Widget FormForgetPassword() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: Column(
          children: [
            CustomInputNoHide(
              title: 'Email',
              onTextChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              hintText: 'Masukkan Email',
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomInputHide(
              title: 'Password Baru',
              hintText: 'Masukkan Password Baru',
              onTextChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomInputHide(
              title: 'Konfirmasi Password Baru',
              hintText: 'Masukkan Konfirmasi Password Baru',
              onTextChanged: (value) {
                setState(() {
                  konfirmasiPassword = value;
                });
              },
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomButton(
              widht: double.infinity,
              verticalMargin: defaultMargin,
              text: 'Perbarui Password',
              onPressed: () {
                handleForgetPassword();
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: HeaderImage(),
            ),
            Center(
              child: Column(
                children: [
                  HeaderWelcomeText(),
                  FormForgetPassword(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
