import 'package:app/application/following/following_posts_event.dart';
import 'package:app/application/following/following_posts_state.dart';
import 'package:app/application/notification/notifications_event.dart';
import 'package:app/application/notification/notifications_state.dart';
import 'package:app/domain/feeds/posts_service.dart';
import 'package:app/domain/notification/notification_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationService _notificationService;

  NotificationBloc(this._notificationService)
      : super(NotificationStateUnInitialized());

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is FetchNotificationEvent) {
      yield FetchingNotificationState();
      yield await fetchNotifications();
    }
  }

  Future<NotificationState> fetchNotifications() async {
    var responseEntity = await _notificationService.fetchNotifications();
    if (responseEntity.isError) {
      return FetchNotificationStateFailure(responseEntity.errors.message);
    }
    return FetchNotificationStateSuccess(responseEntity.data);
  }
}
