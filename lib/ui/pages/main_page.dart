import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/pages/home_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_bottom_navigation_item.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget BuildContent() {
      return HomePage();
    }

    Widget CustomBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
              bottom: 30, left: defaultMargin, right: defaultMargin),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 2,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_home.png',
                isSelected: true,
              ),
              CustomBottomNavigationItem(imageUrl: 'assets/icon_booking.png'),
              CustomBottomNavigationItem(imageUrl: 'assets/icon_setting.png'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            BuildContent(),
            CustomBottomNavigation(),
          ],
        ),
      ),
    );
  }
}
