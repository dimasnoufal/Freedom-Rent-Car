import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_hide.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import '../../shared/theme.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

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
              onTextChanged: (value) {},
              hintText: 'Masukkan Email',
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomInputHide(
              title: 'Password Lama',
              hintText: 'Masukkan Password Lama',
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomInputHide(
              title: 'Password Baru',
              hintText: 'Masukkan Password Baru',
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomButton(
              widht: double.infinity,
              verticalMargin: defaultMargin,
              text: 'Perbarui Password',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Forget Password Berhasil'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
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
