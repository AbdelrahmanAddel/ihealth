import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/feature/chat/presentation/cubit/chat_cubit.dart';

import '../widget/chat_bot_app_bar.dart';
import '../widget/chat_bot_body.dart';
import '../widget/chat_text_form_field.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ChatCubit(),
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<ChatCubit>(context);

            return Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.0.h),
                  child: chatBotAppBar(),
                ),
                Expanded(
                  child: SizedBox(
                    child: BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        return ListView.builder(
                            itemCount: cubit.chatMessages.length >=
                                    cubit.userMessage.length
                                ? cubit.chatMessages.length
                                : cubit.userMessage.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ChatBotBody(
                                chatCubit: cubit,
                                currentIndex: index,
                              );
                            });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.0.w),
                  child: chatTextFormField(chatCubit: cubit),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
