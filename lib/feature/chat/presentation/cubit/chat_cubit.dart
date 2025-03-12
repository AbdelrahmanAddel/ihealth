import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/chat/domain/usecase/send_data_usecase.dart';
import 'package:i_health/feature/dictionary/data/diease_model.dart';
import 'package:i_health/feature/dictionary/data/disease_info.dart';
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

  void stopSpeech() async {
    await speechToText.stop();
    isListening = false;
    emit(StopListenting());
  }

  Future<void> sendDataToApi() async {
    emit(LoadingToSendAndGetData());

    final response = await serviceLocator<SendDataUsecase>()
        .call(inputText: chatFormFieldController.text);

    response.fold(
      (failure) {
        emit(FailureToSendAndGetData(errorMessage: failure.errorMessage));
      },
      (success) {
        if (success == null || success.isEmpty) {
          chatMessages.add("Received an empty response from the API.");
          emit(SendAndGetDataSuccess());
          return;
        }

        userMessage.add(chatFormFieldController.text);

        final diseaseData = diseaseInfo.firstWhere(
            (test) => test.disease
                .split(', ') // تحويل الـ String إلى List<String>
                .any((item) =>
                    item.toLowerCase().trim() == success.toLowerCase().trim()),
            orElse: () => DiseaseInfoModel.empty());

        if (diseaseData.disease.isNotEmpty) {
          chatMessages.add(
              'I suspect that you might have  $success \n I Recommend: ${diseaseData.lifestyle} We also advise consulting a specialist in ${diseaseData.doctorSpecialization} for personalized guidance and treatment.');
        } else {
          chatMessages.add("Sorry, I couldn't find relevant information.");
        }

        print(success);
        emit(SendAndGetDataSuccess());
      },
    );
  }
}
