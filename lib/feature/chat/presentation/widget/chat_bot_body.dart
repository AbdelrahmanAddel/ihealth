import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/chat_cubit.dart';
import '../sections/chat_bot_container_section.dart';
import '../sections/user_container_section.dart';

class ChatBotBody extends StatelessWidget {
  const ChatBotBody(
      {super.key, required this.chatCubit, required this.currentIndex});
  final ChatCubit chatCubit;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: UserContainerSection(
                chatCubit: chatCubit,
                currentIndex: currentIndex,
              )),
          SizedBox(
            height: 35.h,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Flexible(
                child: ChatBotContainerSection(
                  chatCubit: chatCubit,
                  currentIndex: currentIndex,
                ),
              )),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
}
