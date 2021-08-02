import 'package:app/domain/Event/Event.dart';

abstract class EventState {}

class EventStateUnInitialized extends EventState{}
class FetchingEventState extends EventState{}
class FetchEventStateSuccess extends EventState {
  final List<Event> events;

  FetchEventStateSuccess(this.events);
}
class FetchEventStateFailure extends EventState {
  final String error;

  FetchEventStateFailure(this.error);
}