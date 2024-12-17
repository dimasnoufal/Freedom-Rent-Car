import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_rent_car_app/cubit/page_cubit.dart';
import 'package:freedom_rent_car_app/ui/pages/admins/admin_booking_page.dart';
import 'package:freedom_rent_car_app/ui/pages/admins/admin_home_page.dart';
import 'package:freedom_rent_car_app/ui/pages/admins/admin_profile_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_bottom_navigation_item.dart';
import '../../../shared/theme.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget BuildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return AdminHomePage();
        case 1:
          return AdminBookingPage();
        case 2:
          return AdminProfilePage();
        default:
          return AdminHomePage();
      }
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
                  index: 0, imageUrl: 'assets/icon_home.png'),
              CustomBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_setting.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currrentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                BuildContent(currrentIndex),
                CustomBottomNavigation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
