import '../models/user_reviews_model.dart';
import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier{
  List<UserModel> userList = [];
  late UserModel _userModel;

  UserModel get userModel => _userModel;

  void getAllUsers() async {
    userList = await DbHelper.getAllUsers();
    notifyListeners();
  }

  Future<int> insertUser(UserModel userModel) {
    return DbHelper.insertUser(userModel);
  }

  Future<int> insertUserReview(UserReviews userReviews) {
    return DbHelper.insertUserReview(userReviews);
  }

  Future<UserModel?> getUserByEmail(String email) {
    return DbHelper.getUserByEmail(email);
  }

  Future<void> getUserById(int id) async {
    _userModel = await DbHelper.getUserById(id);

  }
  Future<UserModel> getDonorById(int id) {
    return DbHelper.getDonorById(id);
  }

  Future<List<UserReviews>> getReviewsByDonorId(int id) =>
      DbHelper.getReviewsByDonorId(id);

  Future<double> getRatingsByDonorId(int donorId) async {
    final ratingList = await DbHelper.getRatingsByDonorId(donorId);
    return _calculateRating(ratingList);
  }

  Future<bool> didUserRate(int donorId) =>
      DbHelper.didUserRate(donorId, _userModel.userId!);

  Future<int> updateRating(UserReviews userReviews) =>
      DbHelper.updateRating(userReviews);

  double _calculateRating(List<UserReviews> ratingList) {
    double rating = 0.0;
    for(var rat in ratingList) {
      rating += rat.rating;
    }
    return rating / ratingList.length;
  }

}
