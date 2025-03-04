import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_text_style.dart';
import '../cubit/chat_cubit.dart';

class ChatBotContainerSection extends StatelessWidget {
  const ChatBotContainerSection({
    super.key,
    required this.chatCubit,
    required this.currentIndex,
  });
  final ChatCubit chatCubit;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250.w),
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.17),
                  blurRadius: 10.r,
                  offset: const Offset(0, 10))
            ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  softWrap: true,
                  maxLines: 5,
                  chatCubit.chatMessages[currentIndex],
                  style:
                      AppTextStyle.poppins40014.copyWith(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
