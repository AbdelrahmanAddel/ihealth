import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/sign_in/domain/repositiry/sign_in_repositiry.dart';

import '../data_source/firebase/sign_in.dart';

class SignInRepositiryImpl extends SignInRepositiry {
  @override
  Future<Either<Failure, String>> signIn(
      {required String email, required String password}) {
    return serviceLocator<FireBaseSignIn>()
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
