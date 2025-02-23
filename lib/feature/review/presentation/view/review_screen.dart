import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/feature/review/presentation/cubit/reviews_cubit.dart';
import 'package:i_health/feature/review/presentation/view/widget/review_list_.dart';

import 'widget/custom_review_bottom.dart';
import 'widget/review_app_bar.dart';
import 'widget/review_text_form_field.dart';

class ReviewView extends StatelessWidget {
  ReviewView({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: BlocProvider(
            create: (context) => ReviewsCubit()..getReview(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: reviewViewAppBar(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ReviewTextFormField(),
                const SizedBox(
                  height: 10,
                ),
                CustomReviewButton(formKey: formKey),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.peopleReview,
                      style: AppTextStyle.poppins50020,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(
                  child: ReviewsList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
