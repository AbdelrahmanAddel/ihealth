import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';

abstract class UpdateUserPasswordRepositiry {
  Future<Either<Failure, String>> updataUserPassword(
      {required String passowrd, required String oldPassowrd});
}
