import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/domain/repositiry/updata_user_password.dart';

class UpdatePasswordUsecase {
  Future<Either<Failure, String>> call({required String passowrd, required String oldPassowrd}) {
    return serviceLocator<UpdateUserPasswordRepositiry>()
        .updataUserPassword(passowrd: passowrd, oldPassowrd: oldPassowrd);
  }
}
