import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:freedom_rent_car_app/models/all_cars_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';

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
  late ApiService _apiService;
  List<Datumz> allCars = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeApiService();
  }

  Future<void> _initializeApiService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    print(token);

    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    _apiService = ApiService(dio);

    handleGetAllCars();
  }

  void handleGetAllCars() async {
    try {
      AllCarsResponse response = await _apiService.getAllCars();
      print(response.meta.message);

      setState(() {
        allCars = response.data;
        print(allCars);
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Fetch Data Berhasil'),
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

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
            ...allCars
                .map((car) => RentCarTile(
                      name: car.name,
                      year: car.year,
                      imageUrl: car.image,
                      rating: double.parse(car.rating ?? '0.0'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AdminEditCar(
                            carId: car.id,
                            name: car.name,
                            year: car.year,
                            imageUrl: car.image,
                            rating: double.parse(car.rating ?? '0.0'),
                            about: car.about,
                            price: car.price,
                            quantity: car.quantity,
                            feature1: car.feature1,
                            feature2: car.feature2,
                            feature3: car.feature3,
                            feature4: car.feature4,
                          );
                        }));
                      },
                    ))
                .toList(),
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
