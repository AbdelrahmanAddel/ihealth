import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/feature/review/presentation/cubit/reviews_cubit.dart';

class ReviewTextFormField extends StatelessWidget {
  const ReviewTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: BlocBuilder<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<ReviewsCubit>(context);

          return TextFormField(
  controller: cubit.reviewController,
  maxLines: 5,
  decoration: InputDecoration(
    labelText: AppStrings.addYourReview,
    labelStyle: AppTextStyle.poppins50020.copyWith(
      fontSize: 15,
      color: Colors.black, 
    ),
    filled: true,
    fillColor: const Color.fromARGB(255, 255, 250, 250), 
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20), 
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey.shade500
       , width: 1,
      
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color:AppColors.greenButton, 
        width: 2.5,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  ),
);
        },
      ),
    );
  }
}
