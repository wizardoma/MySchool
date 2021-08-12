import 'package:app/domain/event/event.dart';
import 'package:app/domain/event/events_list.dart';
import 'package:app/domain/question/question.dart';
import 'package:app/domain/user/user.dart';

import '../post/post.dart';

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
      this.noOfFollowers = 0,
      this.noOfPostsInAWeek = 0});

  factory Space.fromServer(dynamic data) {
    if (data == null) return null;
    return Space(
      id: data["id"],
      spaceName: data["name"],
      users: [],
      events: eventsList,
      questions: [],
      posts: List.generate(6, (index) => Post.Random()),
      description: data["description"],
      imageUrl: data["imageUrl"] ??
          "https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?size=626&ext=jpg",
    );
  }
}
