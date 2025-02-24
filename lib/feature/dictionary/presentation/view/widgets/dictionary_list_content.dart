import 'package:flutter/material.dart';
import 'package:i_health/core/constants/assets.dart';

import 'package:i_health/feature/dictionary/data/disease_info.dart';

import '../../../../../core/constants/app_text_style.dart';

Widget dictionaryListContent({required int index}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 52,
              height: 52,
              child: Center(
                child: Image.asset(
                  width: 35,
                  height: 35,
                  Assets.assetsImagesDictionary,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              diseaseInfo[index].disease,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextStyle.poppins40014.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    ),
  );
}
