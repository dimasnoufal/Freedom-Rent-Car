import 'package:flutter/material.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import 'package:freedom_rent_car_app/ui/widgets/logo_header.dart';
import '../../shared/theme.dart';
import '../../shared/string.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    Widget OnBoadingImageSLider() {
      return CarouselSlider(
        items: [
          Image.asset(
            'assets/icon_onboarding1.png',
            height: 250,
            width: 250,
          ),
          Image.asset(
            'assets/icon_onboarding2.png',
            height: 250,
            width: 250,
          ),
          Image.asset(
            'assets/icon_onboarding3.png',
            height: 250,
            width: 250,
          ),
        ],
        options: CarouselOptions(
          height: 330,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        carouselController: carouselController,
      );
    }

    Widget OnBoardingInformation() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            Text(
              titlesOnBoarding[currentIndex],
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              descriptionsOnBoarding[currentIndex],
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget OnboardingNavigation() {
      Widget IndicatorOnboarding(index) {
        return GestureDetector(
          onTap: () {
            carouselController
                .animateToPage(index); // Pindah ke halaman carousel yang sesuai
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
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
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
                text: 'SKIP',
                widht: 75,
                onPressed: () {
                  carouselController.animateToPage(2);
                  Navigator.pushNamed(context, '/login');
                }),
            Row(
              children: [
                IndicatorOnboarding(0),
                IndicatorOnboarding(1),
                IndicatorOnboarding(2),
              ],
            ),
            TextButton(
              onPressed: () {
                if (currentIndex == 2) {
                  Navigator.pushNamed(context, '/login');
                } else {
                  carouselController.nextPage();
                }
              },
              child: Text(
                'NEXT',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: LogoHearder(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnBoadingImageSLider(),
                  OnBoardingInformation(),
                  OnboardingNavigation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
