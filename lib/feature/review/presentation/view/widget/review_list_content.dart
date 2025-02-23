import 'package:flutter/material.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/feature/review/presentation/cubit/reviews_cubit.dart';

class ReviewListContent extends StatelessWidget {
  const ReviewListContent({
    super.key,
    required this.index,
    required this.state,
  });
  final int index;
  final GetReviewsSuccess state;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.greenButton,
                radius: 22,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  state.reviews[index].userName,
                  style: AppTextStyle.poppins60030.copyWith(fontSize: 17),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${state.reviews[index].timestamp.toDate().year}-'
            '${state.reviews[index].timestamp.toDate().month}-'
            '${state.reviews[index].timestamp.toDate().day}  '
            '${state.reviews[index].timestamp.toDate().hour}:'
            '${state.reviews[index].timestamp.toDate().minute}',
            style: AppTextStyle.poppins60030.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            state.reviews[index].review,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
