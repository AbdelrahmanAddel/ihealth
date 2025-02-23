import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: UserContainerSection(
                chatCubit: chatCubit,
                currentIndex: currentIndex,
              )),
          const SizedBox(
            height: 35,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: ChatBotContainerSection(
                chatCubit: chatCubit,
                currentIndex: currentIndex,
              )),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

