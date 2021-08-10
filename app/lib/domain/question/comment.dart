import 'dart:math';

import 'package:app/domain/user/user.dart';

class Comment {
  final String body;
  final int id;
  final User user;
  final DateTime date;
  final int noOfLikes;
  final int noOfComments;
  final int noOfShares;
  final int noOfViews;

  Comment(
      {this.noOfComments,
      this.noOfShares,
      this.id,
      this.date,
      this.body,
      this.user,
      this.noOfLikes,
      this.noOfViews});

  factory Comment.fromServer(dynamic map) {
    return new Comment(
      id: map['id'],
      body: map['body'] as String,
      user: User.fromServer(map['student']),
      date: DateTime.fromMillisecondsSinceEpoch(map["date"]),
      noOfLikes: Random().nextInt(345),
      noOfComments: Random().nextInt(345),
      noOfShares: Random().nextInt(345),
      noOfViews: Random().nextInt(3450),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'body': this.body,
      'user': this.user,
      'date': this.date,
      'noOfLikes': this.noOfLikes,
      'noOfComments': this.noOfComments,
      'noOfShares': this.noOfShares,
      'noOfViews': this.noOfViews,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'Answer{answer: $body, user: $user, id: $id, date: $date, noOfLikes: $noOfLikes, noOfComments: $noOfComments, noOfShares: $noOfShares, noOfViews: $noOfViews}';
  }
}
