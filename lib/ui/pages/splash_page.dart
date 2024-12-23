import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    splashStart();
  }

  Future splashStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? conditionValue = prefs.getInt('_conditionValue') ?? 0;

    if (conditionValue == 0) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        prefs.setInt('_conditionValue', 1);
        Navigator.pushNamed(context, '/on-boarding');
      });
    } else if (conditionValue == 1) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.pushNamed(context, '/login');
      });
    } else if (conditionValue == 2) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.pushNamed(context, '/main');
      });
    } else if (conditionValue == 3) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.pushNamed(context, '/admin-main');
      });
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo_no_bg.png'),
          ),
        )),
      ),
    );
  }
}
