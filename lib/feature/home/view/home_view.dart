import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/feature/home/view/widget/chat_button_and_text.dart';
import 'package:i_health/feature/home/view/widget/dieaseListAndText.dart';
import 'package:i_health/feature/home/view/widget/home_view_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          const HomeViewAppBar(),
          SizedBox(
            height: 30.h,
          ),
          ChatButtonAndText(),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.featured,
                style: AppTextStyle.poppins50020
                    .copyWith(color: AppColors.greenText),
              ),
            ),
          ),
          SizedBox(
            height: 33.h,
          ),
          SizedBox(
              height: 500.h,
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return DieaseListsAndText(
                    index: index,
                  );
                },
              ))
        ],
      )),
    ));
  }
}
