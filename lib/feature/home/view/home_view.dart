import 'package:flutter/material.dart';
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
          const SizedBox(
            height: 30,
          ),
          ChatButtonAndText(),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.featured,
                style: AppTextStyle.poppins50020
                    .copyWith(color: AppColors.greenText),
              ),
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          SizedBox(
              height: 500,
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
