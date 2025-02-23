part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class LoadingToSignIn extends SignInState {}

final class SignInSuccessful extends SignInState {}

final class FailureToSignIN extends SignInState {
  final String failureMessage;

  FailureToSignIN({required this.failureMessage});
}
