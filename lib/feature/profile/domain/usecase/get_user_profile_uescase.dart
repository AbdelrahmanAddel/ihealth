import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/domain/entitiy/user_profile_entity.dart';

import '../repositiry/get_user_profile.dart';

class GetUserProfileUescase {
  Future<Either<Failure, UserProfileEntity>> call() {
    return serviceLocator<GetUserProfileRepo>().getUserProfileData();
  }
}
