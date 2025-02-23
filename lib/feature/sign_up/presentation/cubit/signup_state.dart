part of 'signup_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignupInitial extends SignUpState {}

final class LoadingTosignUp extends SignUpState {}

final class SignUpSuccessful extends SignUpState {
  final String successMessage;

  SignUpSuccessful({required this.successMessage});
}

final class FailureToSignUp extends SignUpState {
  final String errorMessage;

  FailureToSignUp({required this.errorMessage});
}
