import 'package:flutter/material.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/app_strings.dart';

class AppTextStyle {
  static TextStyle poppins60030 = const TextStyle(
      fontFamily: AppStrings.poppins,
      fontSize: 30,
      color: Color(0xff4D4C4C),
      fontWeight: FontWeight.w800);
  static TextStyle poppins50020 = const TextStyle(
      fontFamily: AppStrings.poppins,
      fontSize: 20,
      color: Color(0xff0A0A0A),
      fontWeight: FontWeight.w500);
  static TextStyle poppins40014 = const TextStyle(
      fontFamily: AppStrings.poppins,
      fontSize: 14,
      color: Color(0xff908F8F),
      fontWeight: FontWeight.w400);
  static TextStyle poppins70020 = const TextStyle(
      fontFamily: AppStrings.poppins,
      fontSize: 20,
      color: Color(0xff000000),
      fontWeight: FontWeight.w700);
  static TextStyle roboto40015 = TextStyle(
      fontFamily: AppStrings.roboto,
      fontSize: 15,
      color: Colors.grey[600],
      fontWeight: FontWeight.w200);
  static TextStyle roboto50018 = const TextStyle(
      fontFamily: AppStrings.roboto,
      fontSize: 18,
      color: AppColors.greenButton,
      fontWeight: FontWeight.w600);
  static TextStyle roboto70018 = const TextStyle(
      fontFamily: AppStrings.roboto,
      fontSize: 18,
      color: AppColors.greenText,
      fontWeight: FontWeight.w600);
}
