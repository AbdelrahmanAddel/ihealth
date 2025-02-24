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
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 250,
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
                borderRadius: BorderRadius.circular(30),
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
