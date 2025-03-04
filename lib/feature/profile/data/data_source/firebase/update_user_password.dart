import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/constants/firebase_strings.dart';

class UpdateUserPassword {
  Future<Either<Failure, String>> updataUserPassword(
      {required String passowrd, required String oldPassowrd}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final userdata = await FirebaseFirestore.instance
          .collection(FireBaseString.user)
          .doc(userId)
          .get();
      if (userdata.get(FireBaseString.password).toString() == oldPassowrd) {
        await FirebaseAuth.instance.currentUser!.updatePassword(passowrd);
        await FirebaseFirestore.instance
            .collection(FireBaseString.user)
            .doc(userId)
            .update({FireBaseString.password: passowrd});
        return const Right('Update Password Successfully');
      } else {
        return Left(Failure('Old Password Not Correct'));
      }
    } on FirebaseAuthException catch (error) {
      debugPrint('FireBase Error :$error | Code :${error.code}');
      return Left(Failure(error.message ?? 'UnExcepted Error  '));
    } catch (error, stackTrace) {
      debugPrint('Error :$error');
      debugPrint('Stack Trace :$stackTrace');
      return Left(Failure('UnKnown Error :$error'));
    }
  }
}
