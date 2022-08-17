import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTextTheme {
  ///1.Heading Style
  ///2.InputText Style
  ///3.ButtonText Style

  //Heading Style
  static TextStyle heading1Style = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.headingColor);
  static TextStyle heading2Style = heading1Style.copyWith(fontSize: 22);
  static TextStyle heading3Style = heading1Style.copyWith(fontSize: 17,fontWeight:FontWeight.w100);
  static TextStyle heading4Style = heading1Style.copyWith(fontSize: 17,fontWeight:FontWeight.normal,color: AppColors.errorBorderColor);
//InputText Style
  static TextStyle inputTextStyle = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w300, color: AppColors.headingColor);
  //InputText Style
  static TextStyle inputTextStyle3 = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.headingColor);
//InputText Style
  static TextStyle inputTextStyle1 = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w300, color: AppColors.headingColor);
  // Button Style
  static TextStyle buttonTextStyle = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w200, color: AppColors.backgroundColor);
  static var heading3 = heading2Style.copyWith(
      color: AppColors.loginBGColor, fontSize: 15, fontWeight: FontWeight.w200);
  static var subtitle1 = GoogleFonts.poppins(
      color: AppColors.loginDesignColor,
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600));
  static var body = GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w100));
  static var body1 = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: AppColors.appBarTitleColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline));
}

