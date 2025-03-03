import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_style.dart';

Widget signUpHeadSection() {
  return Column(
    children: [
      Text(
        AppStrings.registerWithUs,
        style: AppTextStyle.poppins70020,
      ),
      SizedBox(
        height: 13.h,
      ),
      Text(
        AppStrings.yourInformantion,
        style: AppTextStyle.roboto40015,
      ),
    ],
  );
}
