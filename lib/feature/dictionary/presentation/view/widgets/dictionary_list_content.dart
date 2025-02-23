import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_health/core/constants/assets.dart';
import 'package:i_health/feature/dictionary/data/disease_info.dart';

import '../../../../../core/constants/app_text_style.dart';

Widget dictionaryListContent({required int index}) {
  return Column(
    children: [
      Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.green),
          child: SvgPicture.asset(
            Assets.assetsImagesDisease,
            color: Colors.white,
          )),
      const SizedBox(
        height: 5,
      ),
      Text(
        diseaseInfo[index].disease,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.poppins40014.copyWith(color: Colors.black),
      )
    ],
  );
}
