part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class LoadingToAddReview extends ReviewsState {}

final class AddReviewSuccess extends ReviewsState {
  final String successMessage;

  AddReviewSuccess({required this.successMessage});
}

final class FailureToAddReview extends ReviewsState {
  final String errorMessage;

  FailureToAddReview({required this.errorMessage});
}

final class LoadingToGetReviews extends ReviewsState {}

final class GetReviewsSuccess extends ReviewsState {
  final List<ReviewsModel> reviews;

  GetReviewsSuccess({required this.reviews});
}

final class FailureToGetReview extends ReviewsState {
  final String errorMessage;

  FailureToGetReview({required this.errorMessage});
}
