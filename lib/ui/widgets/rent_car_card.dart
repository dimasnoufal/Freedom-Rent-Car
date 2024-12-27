import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class RentCarCard extends StatelessWidget {
  final String name;
  final String year;
  final String imageUrl;
  final double rating;
  final Function() onTap;
  const RentCarCard({
    super.key,
    required this.name,
    required this.year,
    required this.imageUrl,
    this.rating = 0.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(18)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      Text(
                        rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    year,
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
