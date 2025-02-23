import 'package:flutter/material.dart';
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
      const SizedBox(
        width: 9,
      ),
      Text(
        AppStrings.iHealth,
        style: AppTextStyle.poppins60030.copyWith(fontSize: 16),
      ),
      const SizedBox(
        width: 50,
      ),
      Text(
        AppStrings.chat,
        style: AppTextStyle.poppins60030.copyWith(fontSize: 24),
      ),
    ],
  );
}