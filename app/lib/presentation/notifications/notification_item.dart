import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/notification/notification.dart' as nt;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationItem extends StatelessWidget {
  final nt.Notification notification;

  const NotificationItem({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      tileColor: Colors.transparent,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(defaultSpacing),
      leading: Image.asset(
        "assets/images/question_mark.png",
        width: 20,
        height: 20,
      ),
      trailing: Icon(
        Icons.more_horiz,
        size: 25,
      ),
      title: Text(
        "${notification.spaceName} . ${notification.isPost ? "Posted by" : "Answered by"} ${notification.userName} . ${DateFormat('MMM d, y').format(notification.date)} ",
        style: TextStyle(color: Colors.black54, fontSize: 12),
      ),
      subtitle: Column(
        children: [
          kVerticalSpaceSmall,
          Container(
            padding: EdgeInsets.symmetric(vertical: defaultSpacing * 0.3, horizontal: defaultSpacing * 0.3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
              notification.postTitle,
              style: kPostTitleTextStyle,
            ),
          ),
          kVerticalSpaceSmall
        ],
      ),
    );
  }
}
