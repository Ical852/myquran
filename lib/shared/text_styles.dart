import 'package:flutter/material.dart';
import 'package:myquran/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get text => copyWith(color: textPrim);
  TextStyle get black => copyWith(color: blackColor);
  TextStyle get grey => copyWith(color: greyColor);
  TextStyle get white => copyWith(color: whiteColor);
  TextStyle get danger => copyWith(color: redColor);
  TextStyle get info => copyWith(color: infoColor);
  TextStyle get success => copyWith(color: successColor);

  TextStyle get light => copyWith(fontWeight: fontLight);
  TextStyle get regularF => copyWith(fontWeight: fontRegular);
  TextStyle get mediumF => copyWith(fontWeight: fontMedium);
  TextStyle get semiBold => copyWith(fontWeight: fontSemiBold);
  TextStyle get bold => copyWith(fontWeight: fontBold);
  TextStyle get extraBold => copyWith(fontWeight: fontBold);
  TextStyle get blackBold => copyWith(fontWeight: fontBlackBold);
}

TextStyle xSmall = GoogleFonts.openSans().copyWith(
  fontSize: xSmallSize,
);
TextStyle small = GoogleFonts.openSans().copyWith(
  fontSize: smallSize,
);
TextStyle regular = GoogleFonts.openSans().copyWith(
  fontSize: regularSize,
);
TextStyle medium = GoogleFonts.openSans().copyWith(
  fontSize: mediumSize,
);
TextStyle large = GoogleFonts.openSans().copyWith(
  fontSize: largeSize,
);
TextStyle mega = GoogleFonts.openSans().copyWith(
  fontSize: megaSize,
);
TextStyle extra = GoogleFonts.openSans().copyWith(
  fontSize: extraSize,
);
TextStyle xLarge = GoogleFonts.openSans().copyWith(
  fontSize: xLargeSize,
);
TextStyle mass = GoogleFonts.openSans().copyWith(
  fontSize: massSize,
);
