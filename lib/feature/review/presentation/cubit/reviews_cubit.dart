import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/review/data/model/reviews_model.dart';
import 'package:i_health/feature/review/domain/usecase/review_usecase.dart';
import 'package:meta/meta.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());
  final reviewController = TextEditingController();
  addReview() async {
    emit(LoadingToAddReview());
    final responce = await serviceLocator<ReviewUsecase>().addReviewUsecase(
        review: reviewController.text, timestamp: Timestamp.now());
    responce.fold(
        (failure) =>
            emit(FailureToAddReview(errorMessage: failure.errorMessage)),
        (successMessage) async {
      emit(AddReviewSuccess(successMessage: successMessage));
      await getReview();
    });
  }

  getReview() async {
    emit(LoadingToGetReviews());
    final responce = await serviceLocator<ReviewUsecase>().getReviews();
    responce.fold(
        (failure) =>
            emit(FailureToGetReview(errorMessage: failure.errorMessage)),
        (reviews) => emit(GetReviewsSuccess(reviews: reviews)));
  }
}
