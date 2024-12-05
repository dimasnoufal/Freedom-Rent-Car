import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

double defaultMargin = 24.0;
double defaultRadius = 17.0;

const Color kPrimaryColor = Color(0xFF85E2FC);
const Color kBlackColor = Color(0xFF000000);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kGreyColor = Color(0xff9698A9);
const Color kGreenColor = Color(0xff0EC3AE);
const Color kRedColor = Color(0xffEB70A5);
const Color kBackgroundColor = Color(0xffFAFAFA);
const Color kInactiveColor = Color(0xffDBD7EC);
const Color kTransparentColor = Colors.transparent;

TextStyle blackTextStyle = google_fonts.GoogleFonts.poppins(
  color: kBlackColor,
);

TextStyle whiteTextStyle = google_fonts.GoogleFonts.poppins(
  color: kWhiteColor,
);

TextStyle greyTextStyle = google_fonts.GoogleFonts.poppins(
  color: kGreyColor,
);

TextStyle greenTextStyle = google_fonts.GoogleFonts.poppins(
  color: kGreenColor,
);

TextStyle redTextStyle = google_fonts.GoogleFonts.poppins(
  color: kRedColor,
);

TextStyle primaryTextStyle = google_fonts.GoogleFonts.poppins(
  color: kPrimaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
