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
