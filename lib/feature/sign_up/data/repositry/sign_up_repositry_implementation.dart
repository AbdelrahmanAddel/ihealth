import 'package:dartz/dartz.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/sign_up/domain/repositry/sing_up_repositiry.dart';

import '../../../../core/common/failure_model.dart';
import '../data_source/firebase/sign_up.dart';

class SignUpRepositryImplementation extends SingUpRepositiry {
  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {
        required String fullName,
        required String email,
      required String password,
      required String phoneNumber}) async {
    return await serviceLocator<FireBaseSignUp>().signUpWithEmailAndPassword(
        email: email, password: password, phoneNumber: phoneNumber,
        fullName: fullName
        );
  }
}
