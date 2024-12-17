import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/pages/detail_car_rent.dart';
import 'package:freedom_rent_car_app/ui/pages/profile_page.dart';
import 'package:freedom_rent_car_app/ui/widgets/rent_car_card.dart';
import 'package:freedom_rent_car_app/ui/widgets/rent_car_tile.dart';
import '../../shared/theme.dart';
import '../../shared/string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();

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
                    RentCarCard(
                      name: 'Galardo',
                      year: '2000',
                      imageUrl: 'assets/logo_no_bg.png',
                      rating: 5.0,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailCarRent(
                              name: nameOfCar[0],
                              year: '2020',
                              imageUrl: 'assets/logo_no_bg.png',
                              rating: 5.0,
                              about: aboutOfCar[0],
                              price: 1500000,
                              feature1: featuretOfCar[0],
                              feature2: featuretOfCar[1],
                              feature3: featuretOfCar[2],
                              feature4: featuretOfCar[3]);
                        }));
                      },
                    ),
                    RentCarCard(
                      name: 'Galardo',
                      year: '2000',
                      imageUrl: 'assets/logo_no_bg.png',
                      rating: 5.0,
                      onTap: () {},
                    ),
                    RentCarCard(
                      name: 'Galardo',
                      year: '2000',
                      imageUrl: 'assets/logo_no_bg.png',
                      rating: 5.0,
                      onTap: () {},
                    ),
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
