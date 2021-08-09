import 'dart:math';

import 'package:app/domain/event/event.dart';
import '../post/post.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/domain/user/user.dart';

class Space {
  final int id;
  final String spaceName;
  final String imageUrl;
  final List<Post> posts;
  final List<Event> events;
  final String description;
  final List<Question> questions;
  final List<User> users;
  final int noOfFollowers;
  final int noOfPostsInAWeek;

  Space(
      {this.events,
      this.imageUrl,
      this.id,
      this.spaceName,
      this.posts,
      this.description,
      this.questions,
      this.users,
      this.noOfFollowers,
      this.noOfPostsInAWeek});

  factory Space.fromServer(dynamic data) {
    if (data == null) return null;
    return Space(
      id: data["id"],
      spaceName: data["name"],
      description: data["description"],
      imageUrl: data["imageUrl"],
    );
  }
}
