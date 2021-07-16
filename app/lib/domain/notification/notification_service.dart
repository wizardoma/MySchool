import 'package:app/domain/notification/notification_client.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';

class NotificationService extends Service {
  final NotificationClient _notificationClient;

  NotificationService(this._notificationClient);

  Future<ResponseEntity> fetchNotifications() async {
    return await _notificationClient.fetchNotifications();
  }
}
