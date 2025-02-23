import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_style.dart';

Widget signUpHeadSection() {
  return Column(
    children: [
      Text(
        AppStrings.registerWithUs,
        style: AppTextStyle.poppins70020,
      ),
      const SizedBox(
        height: 13,
      ),
      Text(
        AppStrings.yourInformantion,
        style: AppTextStyle.roboto40015,
      ),
    ],
  );
}
