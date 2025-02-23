import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/constants/firebase_strings.dart';

import '../../model/reviews_model.dart';

abstract class GetAddReviews {
  Future<Either<Failure, String>> addReviews(
      {required String review, required Timestamp timestamp});
  Future<Either<Failure, List<ReviewsModel>>> getReviews();
}

class GetAddReviewsImpl extends GetAddReviews {
  @override
  Future<Either<Failure, String>> addReviews(
      {required String review, required Timestamp timestamp}) async {
    final userDoc = await FirebaseFirestore.instance
        .collection(FireBaseString.user)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    ReviewsModel reviewsModel = ReviewsModel(
        review: review,
        timestamp: timestamp,
        userName: userDoc.get(FireBaseString.fullName));
    try {
      await FirebaseFirestore.instance
          .collection(FireBaseString.reviews)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(reviewsModel.toJson());
      return const Right('Add Review Success');
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return Left(Failure(e.message ?? 'Un Excepted FirebaseException'));
    } catch (error) {
      print('Un Excepted error${error.toString()}');
      return Left(Failure('Un Excepted error$error'));
    }
  }

  @override
  Future<Either<Failure, List<ReviewsModel>>> getReviews() async {
    List<ReviewsModel> reviewsList = [];
    try {
      final reviews = await FirebaseFirestore.instance
          .collection(FireBaseString.reviews)
          .get();
      for (var review in reviews.docs) {
        reviewsList.add(ReviewsModel.fromJson(review.data()));
      }
      return Right(reviewsList);
    } on FirebaseException catch (error) {
      print(error.toString());
      return Left(
          Failure(error.message ?? 'Un Excepted FirebaseAuth Exception'));
    } catch (error) {
      print(error.toString());
      return Left(Failure('UnExcepted error  $error'));
    }
  }
}
