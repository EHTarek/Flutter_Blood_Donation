
import '../models/user_model.dart';

const String tableUserReview = 'tbl_user_review';
const String tblUserReviewColId = 'user_id';
const String tblUserReviewColDonorId = 'donor_id';
const String tblUserReviewColUserReview = 'user_review';
const String tblUserReviewColReviewDate = 'review_date';
const String tblUserReviewColRating = 'rating';

class UserReviews {
  int userId;
  int donorId;
  String? userName;
  String? userImage;
  String userReview;
  String reviewDate;
  double rating;


  UserReviews(
      {required this.userId,
      required this.donorId,
      this.userName,
        this.userImage,
      required this.userReview,
      required this.rating,
      required this.reviewDate});

  Map<String, dynamic> toMap() {
    final map = <String,dynamic>{
      tblUserReviewColId : userId,
      tblUserReviewColDonorId : donorId,
      tblUserReviewColUserReview : userReview,
      tblUserReviewColReviewDate: reviewDate,
      tblUserReviewColRating: rating,
    };
    return map;
  }

  factory UserReviews.fromMap
      (Map<String,dynamic> map) =>
      UserReviews(
        userId: map[tblUserReviewColId],
        donorId: map[tblUserReviewColDonorId],
        userReview: map[tblUserReviewColUserReview],
        reviewDate: map[tblUserReviewColReviewDate],
        userName: map[tblUserColName],
        userImage: map[tblUserColImage],
        rating: map[tblUserReviewColRating],
      );
}

