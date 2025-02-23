import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/chat/domain/usecase/send_data_usecase.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial()) {
    initSpeechToText();
  }
  final chatFormFieldController = TextEditingController();
  late SpeechToText speechToText;
  List<String> chatMessages = [];
  List<String> userMessage = [];
  String userText = '';
  bool isListening = false;

  void initSpeechToText() async {
    speechToText = SpeechToText();
    bool available = await speechToText.initialize();
    if (available) {
      isListening = false;
      emit(SpeechInit());
    } else {
      emit(StopListenting());
    }
  }

  void startSpeech() async {
    await speechToText.listen(
      onResult: (result) {
        chatFormFieldController.text = result.recognizedWords;
        isListening = true;
        emit(IsListeningNow());
      },
    );
  }

  void stopSpeech()async {
   await speechToText.stop();
    isListening = false;
    emit(StopListenting());
  }

  sendDataToApi() async {
    emit(LoadingToSendAndGetData());
    final responce = await serviceLocator<SendDataUsecase>()
        .call(inputText: chatFormFieldController.text);

    responce.fold((failure) {
      print('ERROR => ${failure.errorMessage}');
      emit(FailureToSendAndGetData(errorMessage: failure.errorMessage));
    }, (success) {
      userMessage.add(chatFormFieldController.text);
      chatMessages.add(success);
      print(chatMessages.length);
      print(userMessage.length);
      print('Success $success');
      emit(SendAndGetDataSuccess());
    });
  }
}
