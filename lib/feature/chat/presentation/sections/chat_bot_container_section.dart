import 'package:flutter/material.dart';

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
    return Container(
      width: 233,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            maxLines: 5,
            chatCubit.chatMessages[currentIndex],
            style: AppTextStyle.poppins40014.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
