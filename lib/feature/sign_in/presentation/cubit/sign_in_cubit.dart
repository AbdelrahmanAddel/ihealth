import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/firebase_strings.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/sign_in/data/data_source/local_data/shared_pre.dart';
import 'package:i_health/feature/sign_in/domain/usecase/sign_in_usecase.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signInWithEmailAndPassword() async {
    emit(LoadingToSignIn());
    final responce = await serviceLocator<SignInUsecase>()
        .call(email: email.text, password: password.text);
    responce.fold(
        (failure) =>
            emit(FailureToSignIN(failureMessage: failure.errorMessage)),
        (success) async {
      await CacheHelper.setString(key: AppStrings.userId, value: success);
      await saveUserName();
      emit(SignInSuccessful());
    });
  }

  saveUserName() async {
    final userData = await FirebaseFirestore.instance
        .collection(FireBaseString.user)
        .doc(CacheHelper.getData(key: AppStrings.userId))
        .get();

    final username = await userData.get(FireBaseString.fullName);

    await CacheHelper.setString(value: username, key: AppStrings.userName);
    print(CacheHelper.getData(key: AppStrings.userName));
  }
}
