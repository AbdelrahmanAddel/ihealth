import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/constants/firebase_strings.dart';

class UpdataUserData {
  Future<Either<Failure, String>> updataUserData(
      {required String userName, required String phoneNumber}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection(FireBaseString.user)
          .doc(userId)
          .update({
        FireBaseString.fullName: userName,
        FireBaseString.phoneNumber: phoneNumber,
      });
      return const Right('Updata Profile Success');
    } on FirebaseException catch (e) {
      debugPrint('Firebase Erorr : ${e.message} (Code : ${e.code})');
      return Left(Failure(e.message ?? 'Un Excepeted Error'));
    } catch (error, stackTrace) {
      debugPrint('Unknown Firebase Error $error ');
      debugPrint('StackTrace $stackTrace ');
      return Left(
          Failure('An unexpected error occurred. Please try again later.'));
    }
  }
}
