import 'package:app/application/event/events_event.dart';
import 'package:app/application/event/events_state.dart';
import 'package:app/domain/event/event_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Bloc<EventsEvent, EventState> {
  final EventService _eventService;

  EventBloc(this._eventService)
      : super(EventStateUnInitialized());

  @override
  Stream<EventState> mapEventToState(EventsEvent event) async* {
    if (event is FetchEventsEvent) {
      yield FetchingEventState();
      yield await fetchEvents();
    }
  }

  Future<EventState> fetchEvents() async {
    var responseEntity = await _eventService.fetchEvents();
    if (responseEntity.isError) {
      return FetchEventStateFailure(responseEntity.errors.message);
    }
    return FetchEventStateSuccess(responseEntity.data);
  }
}
