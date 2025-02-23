import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_health/core/common/failure_model.dart';

abstract class FireBaseSignIn {
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      {required String email, required String password});
}

class FireBaseSignInImpl extends FireBaseSignIn {
  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return Right(FirebaseAuth.instance.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(Failure('user-not-found'));
      } else if (e.code == 'wrong-password') {
        return Left(Failure('Wrong password provided for that user.'));
      } else {
        return Left(Failure(e.message ?? 'FirebaseAuth Unexception Error'));
      }
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firebase Unexception Error'));
    } catch (error) {
      return Left(Failure('UnExcepted Error ${error.toString()}'));
    }
  }
}
