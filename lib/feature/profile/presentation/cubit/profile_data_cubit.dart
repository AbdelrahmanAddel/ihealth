import 'package:bloc/bloc.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/domain/entitiy/user_profile_entity.dart';
import 'package:i_health/feature/profile/domain/usecase/get_user_profile_uescase.dart';
import 'package:meta/meta.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit() : super(ProfileDataInitial());

  getUserProfileData() async {
    emit(LoadingToGetUserProfileData());
    final responce = await serviceLocator<GetUserProfileUescase>().call();
    responce.fold(
        (failure) => emit(
            FailureToGetUserProfileData(errorMessage: failure.errorMessage)),
        (success) => emit(GetUserProfileDataSuccess(profileData: success)));
  }
}
