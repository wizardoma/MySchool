import 'dart:math';

import 'package:app/domain/posts/post.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/domain/user/user.dart';

class Space {
  final String spaceName;
  final List<Post> posts;
  final String about;
  final List<Question> questions;
  final List<User> users;
  final int noOfFollowers;
  final int noOfPostsInAWeek;

  Space({this.spaceName, this.posts, this.about, this.questions, this.users, this.noOfFollowers, this.noOfPostsInAWeek});

//  factory Space.

}



