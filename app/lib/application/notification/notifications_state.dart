import 'package:app/domain/notification/notification.dart';
import 'package:app/domain/posts/post.dart';

abstract class NotificationState {}

class NotificationStateUnInitialized extends NotificationState{}
class FetchingNotificationState extends NotificationState{}
class FetchNotificationStateSuccess extends NotificationState {
  final List<Notification> notifications;

  FetchNotificationStateSuccess(this.notifications);
}
class FetchNotificationStateFailure extends NotificationState {
  final String error;

  FetchNotificationStateFailure(this.error);
}