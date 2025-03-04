import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/feature/chat/presentation/cubit/chat_cubit.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';

class UserContainerSection extends StatelessWidget {
  const UserContainerSection({
    super.key,
    required this.chatCubit,
    required this.currentIndex,
  });
  final ChatCubit chatCubit;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child: ConstrainedBox(
          constraints:  BoxConstraints(
            maxWidth: 250.w,
          ),
          child: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.greenButton,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.greenButton.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 10))
                ],
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                chatCubit.userMessage[currentIndex],
                style: AppTextStyle.poppins40014.copyWith(
                  color: Colors.white,
                ),
                softWrap: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
