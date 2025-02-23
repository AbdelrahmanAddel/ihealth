import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';

import '../../data/model/reviews_model.dart';

abstract class ReviewRepositiry {
  Future<Either<Failure, String>> addReview(
      {required String review, required Timestamp timestamp});
  Future<Either<Failure, List<ReviewsModel>>> getReviews();
}
