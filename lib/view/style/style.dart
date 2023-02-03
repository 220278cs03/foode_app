import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  static LinearGradient primaryPinkGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xffFF1843),
        Color(0xffFF7E95),
      ]);
  static LinearGradient halfPinkGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xffFF1843).withOpacity(0.5),
        Color(0xffFF1843).withOpacity(0.5),
      ]);



  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const redColor = Color(0xffDA1414);
  static const borderGreyColor = Color(0xffEBEEF2);
  static const textGreyColor = Color(0xffDADEE3);
  static const primaryPink = Color(0xffF43F5E);



  //---------------- grey ----------------//
  static Color shadowColor = const Color(0xff5A6CEA).withOpacity(0.08);
  static const halfBorder = Color(0xffF4F6F9);
  static const darkTextGrey = Color(0xff858C94);

  //---------------------------------- TextStyle ---------------------------------------//

  static textStyleRegular({
    double size = 16,
    Color textColor = blackColor,
  }) {
    return GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w600, color: textColor, fontSize: size);
  }

  static textStyleThin({
    double size = 16,
    Color textColor = blackColor,
  }) {
    return GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w400, color: textColor, fontSize: size);
  }
}
