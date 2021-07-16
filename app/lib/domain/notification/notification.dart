import 'dart:math';

import 'package:app/domain/posts/post.dart';
import 'package:app/domain/space/spaces_list.dart';
import 'package:app/domain/user/usersList.dart';

class Notification {
  final String spaceName;
  final String userName;
  final bool isRead;
  final DateTime date;
  final String postTitle;
  final bool isPost;

  const Notification(
      {this.spaceName,
      this.userName,
      this.isRead,
      this.date,
      this.postTitle,
      this.isPost});

  factory Notification.Random() {
    String spaceName = spacesList[Random().nextInt(spacesList.length)];
    String userName = usersList[Random().nextInt(usersList.length)];
    bool isRead = Random().nextInt(2) == 1;
    bool isPost = Random().nextInt(2) == 1;
    DateTime date =
        DateTime.now().subtract(Duration(hours: Random().nextInt(7000)));
    String postTitle = generalPostTitles.followedBy(mathPostTitles).toList()[
        Random().nextInt(generalPostTitles.length + mathPostTitles.length)];

    return Notification(
      spaceName: spaceName,
      userName: userName,
      isRead: isRead,
      isPost: isPost,
      date: date,
      postTitle: postTitle,
    );
  }
}
