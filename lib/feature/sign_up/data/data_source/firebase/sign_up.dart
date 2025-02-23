import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';

import '../../../../../core/constants/app_strings.dart';
import 'save_user_data.dart';

abstract class FireBaseSignUp {
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password,
      required String phoneNumber});
}

class FireBaseSignUpImplementation extends FireBaseSignUp {
  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await serviceLocator<SaveUserData>().saveUserData(
          email: email,
          password: password,
          phoneNumber: phoneNumber,
          fullName: fullName);
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      return const Right(AppStrings.createAccSuc);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Failure(AppStrings.weakPassword));
      } else if (e.code == 'email-already-in-use') {
        return Left(Failure(AppStrings.emailIsAlready));
      } else {
        return Left(Failure(e.message ?? AppStrings.unexpectedError));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
