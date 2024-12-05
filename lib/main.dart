import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/pages/login_page.dart';
import 'package:freedom_rent_car_app/ui/pages/on_boarding_page.dart';
import 'package:freedom_rent_car_app/ui/pages/splash_page.dart';

void main() {
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
      },
    );
  }
}
