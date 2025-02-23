import 'package:dartz/dartz.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/chat/domain/repositiry/send_data_to_api.dart';

import '../../../../core/common/failure_model.dart';

class SendDataUsecase {
  Future<Either<Failure, String>> call({required String inputText}) {
    return serviceLocator<SendDataToApiRepo>()
        .sendDataToApi(inputText: inputText);
  }
}
