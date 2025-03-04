import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/data/data_source/firebase/update_user_password.dart';
import 'package:i_health/feature/profile/domain/repositiry/updata_user_password.dart';

class UpdateUserPasswordImple extends UpdateUserPasswordRepositiry {
  @override
  Future<Either<Failure, String>> updataUserPassword(
      {required String passowrd, required String oldPassowrd}) {
    return serviceLocator<UpdateUserPassword>()
        .updataUserPassword(passowrd: passowrd, oldPassowrd: oldPassowrd);
  }
}
