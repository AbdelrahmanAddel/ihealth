import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/feature/review/presentation/cubit/reviews_cubit.dart';

import 'review_list_content.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: state is GetReviewsSuccess ? state.reviews.length : 0,
          itemBuilder: (context, index) {
            return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
                child: state is LoadingToGetReviews
                    ? const CustomScrollView()
                    : state is GetReviewsSuccess
                        ? ReviewListContent(
                            index: index,
                            state: state,
                          )
                        : const Text('Some Thing Went Worng'));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox();
          },
        );
      },
    );
  }
}
