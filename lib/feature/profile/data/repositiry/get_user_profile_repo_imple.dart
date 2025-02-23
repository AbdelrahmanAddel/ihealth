import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/data/data_source/firebase/get_user_profile_data.dart';
import 'package:i_health/feature/profile/domain/repositiry/get_user_profile.dart';

import '../../domain/entitiy/user_profile_entity.dart';

class GetUserProfileRepoImple extends GetUserProfileRepo {
  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfileData() async {
    return serviceLocator<GetUserprofileData>().getUserProfileData();
  }
}
