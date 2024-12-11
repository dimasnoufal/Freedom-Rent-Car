import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_hide.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import 'package:freedom_rent_car_app/ui/widgets/logo_header.dart';
import '../../shared/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    postSharedPref();
  }

  Future<void> postSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('_conditionValue', 2);
  }

  @override
  Widget build(BuildContext context) {
    Widget ImageHeader() {
      return Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/logo_bg_1.png'),
          ),
        ),
      );
    }

    Widget WelcomeText() {
      return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            Text(
              'Silahkan Login untuk melanjutkan',
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
          ],
        ),
      );
    }

    Widget LoginHeader() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(24, 120, 24, 0),
        child: Column(
          children: [
            ImageHeader(),
            WelcomeText(),
          ],
        ),
      );
    }

    Widget LoginForm() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: Column(
          children: [
            CustomInputNoHide(title: 'Username', hintText: 'Masukkan Username'),
            CustomInputHide(
                title: 'Password',
                hintText: 'Masukkan Password',
                margin: EdgeInsets.symmetric(vertical: 8)),
            Container(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forget-password');
                    },
                    child: Text(
                      'Lupa Password?',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    )),
              ),
            ),
            CustomButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/main');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login Berhasil'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              widht: double.infinity,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Daftar',
                      style: greenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: LogoHearder(),
                  ),
                  Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginHeader(),
                      LoginForm(),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
