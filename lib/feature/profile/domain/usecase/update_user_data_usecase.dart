import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/domain/repositiry/update_user_data_repo.dart';

class UpdateUserDataUsecase {
  Future<Either<Failure, String>> call(
      {required String userName, required String phoneNumber}) {
    return serviceLocator<UpdateUserDataRepositiry>()
        .updataUserData(userName: userName, phoneNumber: phoneNumber);
  }
}
