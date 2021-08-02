import 'package:app/domain/event/event_client.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';

class EventService extends Service {
  final EventClient eventClient;

  EventService(this.eventClient);
  Future<ResponseEntity> fetchEvents() async {
    return await eventClient.fetchEvents();
  }
}