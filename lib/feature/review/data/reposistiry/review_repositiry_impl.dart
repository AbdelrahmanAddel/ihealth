import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:dartz/dartz.dart';
import 'package:i_health/core/common/failure_model.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/review/data/data_source/firebase/get_add_reviews.dart';
import 'package:i_health/feature/review/data/model/reviews_model.dart';
import 'package:i_health/feature/review/domain/reposistiry/review_repositiry.dart';

class ReviewRepositiryImpl extends ReviewRepositiry {
  @override
 Future<Either<Failure ,String>> addReview({required String review, required Timestamp timestamp}) {
    return serviceLocator<GetAddReviews>()
        .addReviews(review: review, timestamp: timestamp);
  }

  @override
  Future<Either<Failure, List<ReviewsModel>>> getReviews() {
    return serviceLocator<GetAddReviews>().getReviews();
  }
}
