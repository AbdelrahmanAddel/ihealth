import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/sign_up/domain/usecase/sign_up_usecase.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController fullName = TextEditingController();
  SignUpCubit() : super(SignupInitial());
  void signUpWithEmailAndPassword() async {
    emit(LoadingTosignUp());
    final responce = await serviceLocator<SignUpUsecase>().call(
        fullName: fullName.text,
        email: email.text,
        password: password.text,
        phoneNumber: phoneNumber.text);
    responce.fold(
        (errorMessage) =>
            emit(FailureToSignUp(errorMessage: errorMessage.errorMessage)),
        (success) => emit(SignUpSuccessful(successMessage: success)));
  }
}
