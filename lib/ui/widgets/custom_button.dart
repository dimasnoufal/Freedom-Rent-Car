import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double widht;
  final double verticalMargin;
  final double horizontalMargin;
  final Function() onPressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.widht = 0,
    this.verticalMargin = 0,
    this.horizontalMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        child: Text(text,
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium)),
      ),
    );
  }
}
