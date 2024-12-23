import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/models/register_response.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_hide.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_input_no_hide.dart';
import '../../shared/theme.dart';

class RegisterPage extends StatefulWidget {
  final bool conditionAllowOrNo;
  const RegisterPage({super.key, required this.conditionAllowOrNo});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late bool isAllowOrNo;
  late ApiService _apiService;

  late String email;
  late String name;
  late String password;
  late String konfirmasiPassword;

  String phoneNumber = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isAllowOrNo = widget.conditionAllowOrNo;
    final dio = Dio();
    _apiService = ApiService(dio);
  }

  void handleRegister() async {
    if (!isAllowOrNo) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Anda harus menyetujui syarat dan ketentuan'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (password != konfirmasiPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password dan Konfirmasi Password tidak cocok'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    try {
      RegisterResponse response = await _apiService.register(
        email,
        name,
        password,
        phoneNumber,
      );

      Navigator.pushNamed(context, '/login');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Register Berhasil: ${response.data.message}'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Register Gagal: $e'),
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
              'Register',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            Text(
              'Silahkan Register untuk melanjutkan',
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
          ],
        ),
      );
    }

    Widget FormRegister() {
      Widget CheckBoxSyaratdanKetentuan() {
        return Container(
          child: Row(
            children: [
              Checkbox(
                value: isAllowOrNo,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    isAllowOrNo = value!;
                  });
                },
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'Saya setuju dengan ',
                    style: greyTextStyle.copyWith(fontSize: 12),
                    children: [
                      TextSpan(
                        text: 'syarat dan ketentuan',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          color: kPrimaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Container(
                                    width: double.infinity,
                                    child: Text(
                                      'Syarat dan Ketentuan',
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
                                            'Isi syarat dan ketentuan di sini.'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: CustomButton(
                                          text: 'Ok',
                                          widht: 200,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              isAllowOrNo = true;
                                            });
                                          }),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                      ),
                      TextSpan(
                        text: ' yang berlaku',
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: Column(
          children: [
            CustomInputNoHide(
              title: 'Nama Lengkap',
              hintText: 'Masukkan Nama Lengkap',
              onTextChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomInputNoHide(
              title: 'Email',
              hintText: 'Masukkan Email',
              onTextChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomInputHide(
              title: 'Password',
              hintText: 'Masukkan Password',
              onTextChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              margin: EdgeInsets.only(bottom: 16),
            ),
            CustomInputHide(
              title: 'Konfirmasi Password',
              hintText: 'Masukkan Konfirmasi Password',
              onTextChanged: (value) {
                setState(() {
                  konfirmasiPassword = value;
                });
              },
              margin: EdgeInsets.only(bottom: 16),
            ),
            CheckBoxSyaratdanKetentuan(),
            CustomButton(
              widht: double.infinity,
              verticalMargin: defaultMargin,
              text: 'Daftar Sekarang',
              onPressed: () {
                handleRegister();
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
            HeaderWelcomeText(),
            FormRegister(),
          ],
        ),
      ),
    );
  }
}
