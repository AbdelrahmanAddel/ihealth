import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/feature/chat/presentation/cubit/chat_cubit.dart';
import 'package:lottie/lottie.dart';

Widget chatTextFormField({required ChatCubit chatCubit}) {
  return BlocBuilder<ChatCubit, ChatState>(
    builder: (context, state) {
      return SizedBox(
        height: 60,
        child: TextFormField(
          controller: chatCubit.chatFormFieldController,
          style: AppTextStyle.poppins50020.copyWith(fontSize: 14),
          decoration: InputDecoration(
            prefixIcon: MaterialButton(
              onPressed: chatCubit.isListening
                  ? chatCubit.stopSpeech
                  : chatCubit.startSpeech,
              child: chatCubit.isListening
                  ? LottieBuilder.asset('assest/images/recoredAnimation.json')
                  : const Icon(Icons.mic, color: Colors.black),
            ),
            suffixIcon: MaterialButton(
              onPressed: () async {
                await chatCubit.sendDataToApi();
                chatCubit.chatFormFieldController.clear();
              },
              child: state is LoadingToSendAndGetData
                  ? const CircularProgressIndicator(
                      color: AppColors.greenButton,
                    )
                  : const Icon(
                      Icons.send,
                      color: AppColors.greenButton,
                    ),
            ),
            filled: true,
            hintStyle: AppTextStyle.poppins50020.copyWith(fontSize: 14),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      );
    },
  );
}
