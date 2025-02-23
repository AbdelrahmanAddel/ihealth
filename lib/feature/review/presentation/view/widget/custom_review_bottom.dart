import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_health/core/common/widget/custom_flutter_toast.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/feature/review/presentation/cubit/reviews_cubit.dart';

class CustomReviewButton extends StatelessWidget {
  const CustomReviewButton({super.key, required this.formKey});
  final GlobalKey formKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ReviewsCubit>(context);
        return GestureDetector(
          child: Container(
            width: 90,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.greenButton,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: state is LoadingToAddReview
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(AppStrings.add,
                      style: AppTextStyle.poppins70020
                          .copyWith(color: Colors.white)),
            ),
          ),
          onTap: () {
            if (cubit.reviewController.text.isNotEmpty) {
              cubit.addReview();
            } else {
              customFlutterToast(message: AppStrings.reviewCantbe);
            }
          },
        );
      },
    );
  }
}
