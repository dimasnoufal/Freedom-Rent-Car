import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freedom_rent_car_app/services/api_service.dart';

import 'package:freedom_rent_car_app/models/available_cars_response.dart';
import 'package:freedom_rent_car_app/models/top_cars_response.dart';
import 'package:freedom_rent_car_app/ui/pages/detail_car_rent.dart';
import 'package:freedom_rent_car_app/ui/pages/profile_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/rent_car_card.dart';
import 'package:freedom_rent_car_app/ui/widgets/rent_car_tile.dart';
import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();
  late ApiService _apiService;
  List<Datum> availableCars = [];
  List<Datums> topCars = [];

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

    handleGetTopCars();
    handleGetAvailableCars();
  }

  void handleGetTopCars() async {
    try {
      TopCarsResponse response = await _apiService.getTopCars();
      print(response.meta.message);

      setState(() {
        topCars = response.data;
        print(topCars);
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

  void handleGetAvailableCars() async {
    try {
      AvailableCarsResponse response = await _apiService.getAvailableCars();

      setState(() {
        availableCars = response.data;
        print(availableCars);
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
                    return ProfilePage();
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

    Widget ImageSlider() {
      Widget IndicatorOnboarding(index) {
        return GestureDetector(
          onTap: () {
            carouselController
                .animateToPage(index); // Pindah ke halaman carousel yang sesuai
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index ? kPrimaryColor : kGreyColor,
            ),
          ),
        );
      }

      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/logo_no_bg.png',
                  height: 100,
                ),
                Image.asset(
                  'assets/logo_no_bg.png',
                  height: 100,
                ),
                Image.asset(
                  'assets/logo_no_bg.png',
                  height: 100,
                ),
              ],
              options: CarouselOptions(
                height: 100,
                autoPlay: true,
                enableInfiniteScroll: true,
                reverse: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: carouselController,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IndicatorOnboarding(0),
                  IndicatorOnboarding(1),
                  IndicatorOnboarding(2),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget ListCarRentBest() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Poppular Rent Car',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...topCars
                        .map((car) => RentCarCard(
                              name: car.name,
                              year: car.year,
                              imageUrl: car.image,
                              rating: double.parse(car.rating ?? '0.0'),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailCarRent(
                                      carId: car.id,
                                      name: car.name,
                                      year: car.year,
                                      imageUrl: car.image,
                                      rating: double.parse(car.rating ?? '0.0'),
                                      about: car.about,
                                      price: double.parse(
                                          car.price.toString() ?? '0.0'),
                                      feature1: car.feature1,
                                      feature2: car.feature2 ?? '',
                                      feature3: car.feature3 ?? '',
                                      feature4: car.feature4 ?? '');
                                }));
                              },
                            ))
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
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
            ...availableCars
                .map((car) => RentCarTile(
                      name: car.name,
                      year: car.year,
                      imageUrl: car.image,
                      rating: double.parse(car.rating ?? '0.0'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailCarRent(
                              carId: car.id,
                              name: car.name,
                              year: car.year,
                              imageUrl: car.image,
                              rating: double.parse(car.rating ?? '0.0'),
                              about: car.about,
                              price:
                                  double.parse(car.price.toString() ?? '0.0'),
                              feature1: car.feature1,
                              feature2: car.feature2 ?? '',
                              feature3: car.feature3 ?? '',
                              feature4: car.feature4 ?? '');
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
        body: SafeArea(
            child: ListView(
          children: [
            HeaderImageAndProfile(),
            ImageSlider(),
            ListCarRentBest(),
            ListCarRentAll(),
          ],
        )));
  }
}
