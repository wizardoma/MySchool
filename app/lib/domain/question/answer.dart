import 'package:app/domain/user/user.dart';

class Answer {
  final String answer;
  final User user;
  final DateTime date;
  final int noOfLikes;
  final int noOfComments;
  final int noOfShares;

  final int noOfViews;

  Answer(
      {this.noOfComments,
      this.noOfShares,
      this.date,
      this.answer,
      this.user,
      this.noOfLikes,
      this.noOfViews});
}
