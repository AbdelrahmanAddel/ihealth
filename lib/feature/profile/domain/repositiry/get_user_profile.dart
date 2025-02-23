import 'package:dartz/dartz.dart';

import '../../../../core/common/failure_model.dart';
import '../entitiy/user_profile_entity.dart';

abstract class GetUserProfileRepo {
 Future<Either<Failure, UserProfileEntity>>  getUserProfileData();
}
