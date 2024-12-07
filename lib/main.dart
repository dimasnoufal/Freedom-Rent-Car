import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/pages/forget_password_page.dart';
import 'package:freedom_rent_car_app/ui/pages/login_page.dart';
import 'package:freedom_rent_car_app/ui/pages/main_page.dart';
import 'package:freedom_rent_car_app/ui/pages/on_boarding_page.dart';
import 'package:freedom_rent_car_app/ui/pages/register_page.dart';
import 'package:freedom_rent_car_app/ui/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/on-boarding': (context) => const OnBoardingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(
              conditionAllowOrNo: false,
            ),
        '/forget-password': (context) => const ForgetPasswordPage(),
        '/main': (context) => const MainPage(),
      },
    );
  }
}
