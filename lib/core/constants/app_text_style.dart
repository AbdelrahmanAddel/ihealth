import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/app_strings.dart';

class AppTextStyle {
  static TextStyle poppins60030 = TextStyle(
      fontFamily: AppStrings.poppins,
      fontSize: 30.sp,
      color: const Color(0xff4D4C4C),
      fontWeight: FontWeight.w800);
  static TextStyle poppins50020 = TextStyle(
      fontFamily: AppStrings.poppins,
      fontSize: 20.sp,
      color: const Color(0xff0A0A0A),
      fontWeight: FontWeight.w500);
  static TextStyle poppins40014 = TextStyle(
      fontFamily: AppStrings.poppins,
      fontSize: 14.sp,
      color: const Color(0xff908F8F),
      fontWeight: FontWeight.w400);
  static TextStyle poppins70020 = TextStyle(
      fontFamily: AppStrings.poppins,
      fontSize: 20.sp,
      color: const Color(0xff000000),
      fontWeight: FontWeight.w700);
  static TextStyle roboto40015 = TextStyle(
      fontFamily: AppStrings.roboto,
      fontSize: 15.sp,
      color: Colors.grey[600],
      fontWeight: FontWeight.w200);
  static TextStyle roboto50018 = TextStyle(
      fontFamily: AppStrings.roboto,
      fontSize: 18.sp,
      color: AppColors.greenButton,
      fontWeight: FontWeight.w600);
  static TextStyle roboto70018 = TextStyle(
      fontFamily: AppStrings.roboto,
      fontSize: 18.sp,
      color: AppColors.greenText,
      fontWeight: FontWeight.w600);
}
