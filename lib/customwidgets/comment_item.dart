import 'dart:io';
import '../models/user_reviews_model.dart';
import 'package:flutter/material.dart';


class CommentItem extends StatelessWidget {
  final UserReviews userReviews;
  const CommentItem({Key? key, required this.userReviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: FileImage(File(userReviews.userImage ?? 'Unknown'),)),
          title: Text(userReviews.userName ?? 'Unknown'),
          subtitle: Text(userReviews.reviewDate),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(userReviews.userReview),
        ),
      ],
    );
  }
}
