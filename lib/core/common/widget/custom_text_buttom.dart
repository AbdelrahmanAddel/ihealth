import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/constants/app_colors.dart';

class CustomTextButtom extends StatelessWidget {
  const CustomTextButtom({super.key, this.onPressed, required this.child});
  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColors.greenButton,
            minimumSize: Size(double.infinity, 50.h)),
        onPressed: onPressed,
        child: child);
  }
}
