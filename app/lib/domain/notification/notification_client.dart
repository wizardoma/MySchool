import 'package:app/domain/notification/notification.dart';
import 'package:app/domain/response.dart';

class NotificationClient {
  Future<ResponseEntity> fetchNotifications() async {
    return await Future.delayed(Duration(seconds: 2), () {
      return ResponseEntity.Data(
          List.generate(20, (index) => Notification.Random()));
    });
  }
}
