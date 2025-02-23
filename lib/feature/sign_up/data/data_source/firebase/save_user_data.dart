import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/feature/sign_up/data/model/user_data_model.dart';

import '../../../../../core/constants/firebase_strings.dart';

abstract class SaveUserData {
  Future<Either<Failure, void>> saveUserData(
      {required String fullName,
      required String email,
      required String password,
      required String phoneNumber});
}

class SaveUserDataImpl extends SaveUserData {
  @override
  Future<Either<Failure, void>> saveUserData(
      {required String fullName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    UserDataModel userDataModel = UserDataModel(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        fullName: fullName);
    try {
      await FirebaseFirestore.instance
          .collection(FireBaseString.user)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userDataModel.toJson());

      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? AppStrings.unexpectedError));
    }
  }
}
