import 'package:blog_app/app/shared/colors.dart';
import 'package:blog_app/app/shared/fonts.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {
  static const heading1 = TextStyle(
      fontFamily: CustomFonts.MONTSERRATB,
      color: CustomColors.whiteColor,
      fontSize: 50.0);
  static const heading2 = TextStyle(
      fontFamily: CustomFonts.MONTSERRAT,
      color: CustomColors.whiteColor,
      fontSize: 30.0);
  static const bodyText1 = TextStyle(
      fontFamily: CustomFonts.MONTSERRAT,
      color: CustomColors.whiteColor,
      fontSize: 18.0);
  static const bodyTextB1 = TextStyle(
      fontFamily: CustomFonts.MONTSERRATB,
      color: CustomColors.whiteColor,
      fontSize: 24.0);
  static const bodyText2 = TextStyle(
      fontFamily: CustomFonts.MONTSERRAT,
      fontWeight: FontWeight.bold,
      color: CustomColors.whiteColor,
      fontSize: 16.0);

  //! Colorful text
  static const yellowText1 = TextStyle(
      fontFamily: CustomFonts.MONTSERRAT,
      color: CustomColors.yellowColor,
      fontSize: 16.0);
  static const faintText1 = TextStyle(
      fontFamily: CustomFonts.MONTSERRAT,
      color: CustomColors.textColor,
      fontSize: 14.0);
  static const faintText2 = TextStyle(
      fontFamily: CustomFonts.MONTSERRAT,
      fontWeight: FontWeight.bold,
      color: CustomColors.textColor,
      fontSize: 18.0);

  //! Section Text
  static const productTitle = TextStyle(
      fontFamily: CustomFonts.MONTSERRATB,
      color: CustomColors.whiteColor,
      fontSize: 18.0);
  static const productPrice = TextStyle(
      fontFamily: CustomFonts.MONTSERRATB,
      color: CustomColors.textColor,
      fontSize: 16.0);

  //! Detail Section Text
  static const productTitleDetails = TextStyle(
      fontFamily: CustomFonts.MONTSERRATB,
      color: CustomColors.whiteColor,
      fontSize: 34.0);
  static const productPriceDetails = TextStyle(
      fontFamily: CustomFonts.MONTSERRATB,
      color: CustomColors.whiteColor,
      fontSize: 30.0);
  static const productSizeDetails = TextStyle(
      fontFamily: CustomFonts.MONTSERRATB,
      color: CustomColors.whiteColor,
      fontSize: 18.0);
  static const productBuyNow = TextStyle(
      fontFamily: CustomFonts.MONTSERRATB,
      color: CustomColors.darkColor,
      fontSize: 18.0);
}
