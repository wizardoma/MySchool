import 'package:app/domain/event/events_list.dart';
import 'package:app/domain/response.dart';

class EventClient {
  Future<ResponseEntity> fetchEvents() async {
    return await Future.delayed(
      Duration(seconds: 2),
      () => ResponseEntity.Data(eventsList),
    );
  }
}
