import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/sign_in/domain/repositiry/sign_in_repositiry.dart';

class SignInUsecase {
  Future<Either<Failure, String>> call(
      {required String email, required String password}) {
    return serviceLocator<SignInRepositiry>()
        .signIn(email: email, password: password);
  }
}
