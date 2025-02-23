import 'package:dartz/dartz.dart';

import '../../../../core/common/failure_model.dart';

abstract class SendDataToApiRepo {
  Future<Either<Failure, String>> sendDataToApi({required String inputText});
}
