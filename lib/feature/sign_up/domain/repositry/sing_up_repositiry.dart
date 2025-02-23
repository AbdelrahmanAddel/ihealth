import 'package:dartz/dartz.dart';

import '../../../../core/common/failure_model.dart';

abstract class SingUpRepositiry {
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password,
      required String phoneNumber});
}
