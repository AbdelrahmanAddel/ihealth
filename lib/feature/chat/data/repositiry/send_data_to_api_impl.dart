import 'package:dartz/dartz.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/chat/data/data_source/api/send_data_to_api.dart';
import 'package:i_health/feature/chat/domain/repositiry/send_data_to_api.dart';

import '../../../../core/common/failure_model.dart';

class SendDataToApiRepoImpl extends SendDataToApiRepo {
  @override
  Future<Either<Failure, String>> sendDataToApi(
      {required String inputText}) async {
    return serviceLocator<SendDataToApi>().sendDataToApi(inputText: inputText);
  }
}
