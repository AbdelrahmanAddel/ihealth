import 'package:dartz/dartz.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';

import '../../../../core/common/failure_model.dart';
import '../repositry/sing_up_repositiry.dart';

class SignUpUsecase {
  Future<Either<Failure, String>> call(
      {required String fullName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    return await serviceLocator<SingUpRepositiry>().signUpWithEmailAndPassword(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        fullName: fullName);
  }
}
