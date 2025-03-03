import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';

abstract class UpdateUserDataRepositiry {
  Future<Either<Failure, String>> updataUserData(
      {required String userName, required String phoneNumber});
}
