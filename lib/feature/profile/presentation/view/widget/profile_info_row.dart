import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/core/helper/spaceing.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow(
      {super.key,
      required this.rowText,
      required this.prefixIcon,
      required this.suffixIcon});

  final String rowText;
  final Widget prefixIcon;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prefixIcon,
        horizontalSpace(10),
        Text(
          rowText,
          style: AppTextStyle.poppins70020.copyWith(fontSize: 15.sp),
        ),
        const Spacer(),
        suffixIcon
      ],
    );
  }
}
