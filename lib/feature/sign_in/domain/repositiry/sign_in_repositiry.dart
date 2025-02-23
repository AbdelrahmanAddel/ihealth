import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';

abstract class SignInRepositiry {
  Future<Either<Failure, String>> signIn(
      {required String email, required String password});
}
