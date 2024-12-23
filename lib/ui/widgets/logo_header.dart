import 'package:flutter/material.dart';

class LogoHearder extends StatelessWidget {
  const LogoHearder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Image.asset(
        'assets/logo_no_bg.png',
        height: 75,
      ),
    );
  }
}
