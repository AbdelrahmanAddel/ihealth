part of 'profile_data_cubit.dart';

@immutable
sealed class ProfileDataState {}

final class ProfileDataInitial extends ProfileDataState {}

final class LoadingToGetUserProfileData extends ProfileDataState {}

final class FailureToGetUserProfileData extends ProfileDataState {
  final String errorMessage;

  FailureToGetUserProfileData({required this.errorMessage});
}

final class GetUserProfileDataSuccess extends ProfileDataState {
  final UserProfileEntity profileData;

  GetUserProfileDataSuccess({required this.profileData});
}

final class LoadingToUpdataUserData extends ProfileDataState {}

final class UpdataUserDataSuccess extends ProfileDataState {
  final String successMessage;

  UpdataUserDataSuccess({required this.successMessage});
}

final class FailureToUpdataUserData extends ProfileDataState {
  final String errorMessage;

  FailureToUpdataUserData({required this.errorMessage});
}
final class LoadingToUpdateUserPassword extends ProfileDataState {}
final class UpdateUserPasswordSuccess extends ProfileDataState {
  final String successMessage;

  UpdateUserPasswordSuccess({required this.successMessage});
}
final class FailureToUpdateuserPassword extends ProfileDataState {
  final String errorMessage;

  FailureToUpdateuserPassword({required this.errorMessage});
}
