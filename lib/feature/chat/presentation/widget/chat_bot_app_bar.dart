import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/constants/assets.dart';

Widget chatBotAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Spacer(),
      SvgPicture.asset(Assets.assetsImagesTestPlus),
      SizedBox(
        width: 9.w,
      ),
      Text(
        AppStrings.iHealth,
        style: AppTextStyle.poppins60030.copyWith(fontSize: 16.sp),
      ),
      SizedBox(
        width: 50.w,
      ),
      Text(
        AppStrings.chat,
        style: AppTextStyle.poppins60030.copyWith(fontSize: 24.sp),
      ),
    ],
  );
}
