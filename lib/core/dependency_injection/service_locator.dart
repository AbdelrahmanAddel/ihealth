import 'package:get_it/get_it.dart';
import 'package:i_health/feature/chat/data/data_source/api/send_data_to_api.dart';
import 'package:i_health/feature/chat/data/repositiry/send_data_to_api_impl.dart';
import 'package:i_health/feature/profile/data/data_source/firebase/updata_user_data.dart';
import 'package:i_health/feature/profile/data/data_source/firebase/update_user_password.dart';
import 'package:i_health/feature/profile/data/repositiry/updata_user_data_repositiry_impl.dart';
import 'package:i_health/feature/profile/data/repositiry/update_user_password_imple.dart';
import 'package:i_health/feature/profile/domain/repositiry/updata_user_password.dart';
import 'package:i_health/feature/profile/domain/usecase/update_password_usecase.dart';
import 'package:i_health/feature/profile/domain/usecase/update_user_data_usecase.dart';
import 'package:i_health/feature/review/data/data_source/firebase/get_add_reviews.dart';
import 'package:i_health/feature/review/data/reposistiry/review_repositiry_impl.dart';
import 'package:i_health/feature/review/domain/reposistiry/review_repositiry.dart';

import '../../feature/chat/domain/repositiry/send_data_to_api.dart';
import '../../feature/chat/domain/usecase/send_data_usecase.dart';
import '../../feature/profile/data/data_source/firebase/get_user_profile_data.dart';
import '../../feature/profile/data/repositiry/get_user_profile_repo_imple.dart';
import '../../feature/profile/domain/repositiry/get_user_profile.dart';
import '../../feature/profile/domain/repositiry/update_user_data_repo.dart';
import '../../feature/profile/domain/usecase/get_user_profile_uescase.dart';
import '../../feature/review/domain/usecase/review_usecase.dart';
import '../../feature/sign_in/data/data_source/firebase/sign_in.dart';
import '../../feature/sign_in/data/repositiry/sign_in_repositiry_impl.dart';
import '../../feature/sign_in/domain/repositiry/sign_in_repositiry.dart';
import '../../feature/sign_in/domain/usecase/sign_in_usecase.dart';
import '../../feature/sign_up/data/data_source/firebase/save_user_data.dart';
import '../../feature/sign_up/data/data_source/firebase/sign_up.dart';
import '../../feature/sign_up/data/repositry/sign_up_repositry_implementation.dart';
import '../../feature/sign_up/domain/repositry/sing_up_repositiry.dart';
import '../../feature/sign_up/domain/usecase/sign_up_usecase.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  //! SIGN UP
  serviceLocator.registerSingleton<SaveUserData>(SaveUserDataImpl());
  serviceLocator.registerSingleton<FireBaseSignUp>(FireBaseSignUpImplementation());
  serviceLocator.registerSingleton<SingUpRepositiry>(SignUpRepositryImplementation());
  serviceLocator.registerSingleton(SignUpUsecase());

  //! SIGN IN
  serviceLocator.registerSingleton<FireBaseSignIn>(FireBaseSignInImpl());
  serviceLocator.registerSingleton<SignInRepositiry>(SignInRepositiryImpl());
  serviceLocator.registerSingleton(SignInUsecase());

  //! Profile
  serviceLocator.registerSingleton<GetUserProfileRepo>(GetUserProfileRepoImple());
  serviceLocator.registerSingleton<GetUserprofileData>(GetUserProfileDataImple());
  serviceLocator.registerSingleton(GetUserProfileUescase());
  
  //! Profile (Update Data)
  serviceLocator.registerSingleton(UpdataUserData());
  serviceLocator.registerSingleton(UpdateUserDataUsecase());
  serviceLocator.registerSingleton(UpdateUserPassword());

  //! Profile (Update Password)
  serviceLocator.registerSingleton(UpdatePasswordUsecase());
  serviceLocator.registerSingleton<UpdateUserPasswordRepositiry>(UpdateUserPasswordImple());
  serviceLocator.registerSingleton<UpdateUserDataRepositiry>(UpdataUserDataRepositiryImplentation());

  //! Chat
  serviceLocator.registerSingleton<SendDataToApi>(SendDataToApiImpl());
  serviceLocator.registerSingleton<SendDataToApiRepo>(SendDataToApiRepoImpl());
  serviceLocator.registerSingleton(SendDataUsecase());

  //! Review
  serviceLocator.registerSingleton<GetAddReviews>(GetAddReviewsImpl());
  serviceLocator.registerSingleton<ReviewRepositiry>(ReviewRepositiryImpl());
  serviceLocator.registerSingleton(ReviewUsecase());
}
