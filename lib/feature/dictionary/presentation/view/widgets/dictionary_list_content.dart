import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/constants/assets.dart';

import 'package:i_health/feature/dictionary/data/disease_info.dart';

import '../../../../../core/constants/app_text_style.dart';

Widget dictionaryListContent({required int index}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
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
              width: 52.w,
              height: 52.h,
              child: Center(
                child: Image.asset(
                  width: 35.w,
                  height: 35.h,
                  Assets.assetsImagesDictionary,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 11.w),
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
