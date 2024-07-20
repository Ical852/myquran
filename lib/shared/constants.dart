import 'package:flutter/material.dart';

var baseUrl = "https://equran.id/api/v2";

double xSmallSize = 10;
double smallSize = 12;
double regularSize = 14;
double mediumSize = 16;
double largeSize = 18;
double megaSize = 20;
double extraSize = 24;
double massSize = 32;

Color greenColor = Color(0xff588B76);
Color greyColor = Color(0xff8789A3);
Color blackColor = Color(0xff151515);
Color whiteColor = Color(0xFFDEDDDF);
Color redColor = Color(0xffE82626);
Color infoColor = Color(0xff509CE4);
Color successColor = Color(0xff61B176);

Color primary = greenColor;
Color secondary = greyColor;
Color black = blackColor;
Color white = whiteColor;
Color danger = redColor;
Color info = infoColor;
Color success = successColor;

FontWeight fontLight = FontWeight.w300;
FontWeight fontRegular = FontWeight.w400;
FontWeight fontMedium = FontWeight.w500;
FontWeight fontSemiBold = FontWeight.w600;
FontWeight fontBold = FontWeight.w700;
FontWeight fontExtraBold = FontWeight.w800;
FontWeight fontBlackBold = FontWeight.w900;

double safeAreaPadding(context) {
  return MediaQuery.of(context).padding.top;
}

double bottomSafeAreaPadding(context) {
  return MediaQuery.of(context).padding.bottom;
}
