import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/constants/firebase_strings.dart';
import '../../model/user_profile_model.dart';

abstract class GetUserprofileData {
  Future<Either<Failure, UserProfileModel>> getUserProfileData();
}

class GetUserProfileDataImple extends GetUserprofileData {
  
  @override
  Future<Either<Failure, UserProfileModel>> getUserProfileData() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final profileData = await FirebaseFirestore.instance
          .collection(FireBaseString.user)
          .doc(userId)
          .get();
      if (profileData.exists && profileData.data() != null) {
        return Right(UserProfileModel.fromJson(profileData.data()!));
      } else {
        return Left(Failure('User not found'));
      }
    } on FirebaseAuthException catch (error) {
      return Left(Failure(error.message ?? 'Authentication error occurred'));
    } on FirebaseException catch (error) {
      return Left(Failure(error.message ?? 'FireStore error pcoccurredc'));
    } catch (error) {
      return Left(Failure('Unexcepected Error ${error.toString()}'));
    }
  }
}
