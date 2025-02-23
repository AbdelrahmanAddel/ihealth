import 'package:flutter/material.dart';
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
    return Container(
      width: 233,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.greenButton,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            chatCubit.userMessage[currentIndex],
            style: AppTextStyle.poppins40014.copyWith(
              color: const Color(0xff46454C),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        ),
      ),
    );
  }
}
