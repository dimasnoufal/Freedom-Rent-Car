import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class RentCarTileBook extends StatelessWidget {
  final String name;
  final String year;
  // final String imageUrl;
  final String status;
  final Function() onTap;
  const RentCarTileBook({
    super.key,
    required this.name,
    required this.year,
    // required this.imageUrl,
    this.status = 'Booked',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = kRedColor;

    if (status == 'DONE') {
      statusColor = kGreenColor;
    } else if (status == 'ON GOING') {
      statusColor = kPrimaryColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/logo_no_bg.png'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    year,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
