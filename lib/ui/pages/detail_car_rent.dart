import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:freedom_rent_car_app/ui/pages/book_rent_car.dart';
import 'package:freedom_rent_car_app/ui/widgets/custom_button.dart';
import '../../../shared/theme.dart';

class DetailCarRent extends StatefulWidget {
  final int carId;
  final String name;
  final String year;
  final String imageUrl;
  final double rating;
  final String about;
  final double price;
  final String feature1;
  final String feature2;
  final String feature3;
  final String feature4;

  const DetailCarRent({
    super.key,
    required this.carId,
    required this.name,
    required this.year,
    required this.imageUrl,
    required this.rating,
    required this.about,
    required this.price,
    this.feature1 = '',
    this.feature2 = '',
    this.feature3 = '',
    this.feature4 = '',
  });

  @override
  State<DetailCarRent> createState() => _DetailCarRentState();
}

class _DetailCarRentState extends State<DetailCarRent> {
  late String currencyIDR;

  void initState() {
    // TODO: implement initState
    super.initState();
    handleCurrencyPriceIDR();
  }

  void handleCurrencyPriceIDR() {
    final priceIDR = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(widget.price);

    setState(() {
      currencyIDR = (priceIDR);
    });
  }

  Widget backgroundImage() {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget customShadow() {
    return Container(
      width: double.infinity,
      height: 214,
      margin: EdgeInsets.only(top: 236),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kWhiteColor.withOpacity(0),
            Colors.black.withOpacity(0.95),
          ],
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    Widget ImageDetailCarRent(imageDetailCarRent) {
      return Container(
        width: 90,
        height: 90,
        margin: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imageDetailCarRent),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget InterestItem(feature, imageUrl) {
      return Flexible(
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                feature,
                style: blackTextStyle,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Note: Title
          Container(
            margin: EdgeInsets.only(top: 256),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.year,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_star.png',
                      width: 20,
                    ),
                    SizedBox(width: 6),
                    Text(
                      widget.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Note: Description
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Note: About
                Text(
                  'About',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  widget.about,
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular, height: 2),
                ),

                // Note: Image Detail Car Rent
                SizedBox(height: 20),
                Text(
                  'Detail Car Rent',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImageDetailCarRent('assets/detail_interior_car_1.jpg'),
                      ImageDetailCarRent('assets/detail_interior_car_2.jpg'),
                      ImageDetailCarRent('assets/detail_interior_car_3.jpg'),
                      ImageDetailCarRent('assets/detail_interior_car_4.jpg'),
                    ],
                  ),
                ),

                // Note: Features
                SizedBox(height: 20),
                Text(
                  'Features',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    InterestItem(
                      widget.feature1,
                      'assets/icon_check.png',
                    ),
                    InterestItem(
                      widget.feature2,
                      'assets/icon_check.png',
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    InterestItem(
                      widget.feature3,
                      'assets/icon_check.png',
                    ),
                    InterestItem(
                      widget.feature4,
                      'assets/icon_check.png',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Note: Price & Book Button
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currencyIDR.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Per 1 hari',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),

                // Note: Book Button
                CustomButton(
                  text: 'Book Now?',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookRentCar(
                          carId: widget.carId,
                          name: widget.name,
                          year: widget.year,
                          imageUrl: widget.imageUrl,
                          rating: widget.rating,
                          about: widget.about,
                          price: widget.price,
                        ),
                      ),
                    );
                  },
                  widht: 170,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              backgroundImage(),
              customShadow(),
              content(context),
            ],
          ),
        ),
      ),
    );
  }
}
