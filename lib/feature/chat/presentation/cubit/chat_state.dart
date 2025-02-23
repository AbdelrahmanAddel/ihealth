part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class LoadingToSendAndGetData extends ChatState {}

final class FailureToSendAndGetData extends ChatState {
  final String errorMessage;

  FailureToSendAndGetData({required this.errorMessage});
}

final class SendAndGetDataSuccess extends ChatState {}

final class SpeechInit extends ChatState {}

final class IsListeningNow extends ChatState {}

final class StopListenting extends ChatState {}
