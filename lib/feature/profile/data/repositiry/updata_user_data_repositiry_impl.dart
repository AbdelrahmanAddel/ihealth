import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/data/data_source/firebase/updata_user_data.dart';
import 'package:i_health/feature/profile/domain/repositiry/update_user_data_repo.dart';

class UpdataUserDataRepositiryImplentation extends UpdateUserDataRepositiry {
  @override
  Future<Either<Failure, String>> updataUserData(
      {required String userName, required String phoneNumber}) {
    return serviceLocator<UpdataUserData>()
        .updataUserData(userName: userName, phoneNumber: phoneNumber);
  }
}
