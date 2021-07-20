import 'package:app/domain/user/user.dart';

class Answer {
  final String answer;
  final User user;
  final DateTime time;
  final int noOfLikes;
  final int noOfViews;

  Answer({this.answer, this.user, this.time, this.noOfLikes, this.noOfViews});

}