import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/domain/entitiy/user_profile_entity.dart';
import 'package:i_health/feature/profile/domain/usecase/get_user_profile_uescase.dart';
import 'package:i_health/feature/profile/domain/usecase/update_password_usecase.dart';
import 'package:i_health/feature/profile/domain/usecase/update_user_data_usecase.dart';
import 'package:meta/meta.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit() : super(ProfileDataInitial());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController oldPassowrd = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  getUserProfileData() async {
    emit(LoadingToGetUserProfileData());
    final responce = await serviceLocator<GetUserProfileUescase>().call();
    responce.fold(
        (failure) => emit(
            FailureToGetUserProfileData(errorMessage: failure.errorMessage)),
        (success) => emit(GetUserProfileDataSuccess(profileData: success)));
  }

  updateUserProfileData() async {
    emit(LoadingToUpdataUserData());
    if (password.text != confirmPassword.text) {
      emit(FailureToUpdateuserPassword(
          errorMessage: "New password not match with confirm password "));
      return;
    }
    final responce = await serviceLocator<UpdateUserDataUsecase>().call(
        userName: fullNameController.text,
        phoneNumber: phoneNumberController.text);
    responce.fold(
        (failure) =>
            emit(FailureToUpdataUserData(errorMessage: failure.errorMessage)),
        (success) => emit(UpdataUserDataSuccess(successMessage: success)));
  }

  updateUserPassword() async {
    emit(LoadingToUpdateUserPassword());
    final responce = await serviceLocator<UpdatePasswordUsecase>()
        .call(passowrd: password.text, oldPassowrd: oldPassowrd.text);
    responce.fold(
        (failure) => emit(
            FailureToUpdateuserPassword(errorMessage: failure.errorMessage)),
        (success) => emit(UpdateUserPasswordSuccess(successMessage: success)));
  }
}
