import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/pages/admins/admin_add_car.dart';
import 'package:freedom_rent_car_app/ui/pages/admins/admin_edit_car.dart';
import 'package:freedom_rent_car_app/ui/pages/admins/admin_profile_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/rent_car_tile.dart';
import '../../../shared/theme.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget HeaderImageAndProfile() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/logo_no_bg.png'),
                ),
              ),
            ),
            Container(
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AdminProfilePage();
                  }));
                },
                icon: Icon(
                  Icons.account_circle,
                  color: kPrimaryColor,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget ListCarRentAll() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Rent Car',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            RentCarTile(
              name: 'Avanza',
              year: '2000',
              imageUrl: 'assets/logo_no_bg.png',
              rating: 4.6,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AdminEditCar(
                    name: 'Avanza',
                    year: '2000',
                    imageUrl: 'assets/logo_no_bg.png',
                    rating: 4.6,
                    about: 'test',
                    price: 1500000,
                    feature1: 'feature1',
                    feature2: 'feature2',
                    feature3: 'feature3',
                    feature4: 'feature4',
                  );
                }));
              },
            ),
            RentCarTile(
              name: 'Avanza',
              year: '2000',
              imageUrl: 'assets/logo_no_bg.png',
              rating: 4.6,
              onTap: () {},
            ),
            RentCarTile(
              name: 'Avanza',
              year: '2000',
              imageUrl: 'assets/logo_no_bg.png',
              rating: 4.6,
              onTap: () {},
            ),
            RentCarTile(
              name: 'Avanza',
              year: '2000',
              imageUrl: 'assets/logo_no_bg.png',
              rating: 4.6,
              onTap: () {},
            ),
            RentCarTile(
              name: 'Avanza',
              year: '2000',
              imageUrl: 'assets/logo_no_bg.png',
              rating: 4.6,
              onTap: () {},
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 100),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AdminAddCar();
              }));
            },
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.add),
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            HeaderImageAndProfile(),
            ListCarRentAll(),
          ],
        )));
  }
}
