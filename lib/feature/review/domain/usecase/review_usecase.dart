import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/review/domain/reposistiry/review_repositiry.dart';

import '../../data/model/reviews_model.dart';

class ReviewUsecase {
  Future<Either<Failure, String>> addReviewUsecase(
      {required String review, required Timestamp timestamp}) {
    return serviceLocator<ReviewRepositiry>()
        .addReview(review: review, timestamp: timestamp);
  }

  Future<Either<Failure, List<ReviewsModel>>> getReviews() {
    return serviceLocator<ReviewRepositiry>().getReviews();
  }
}
