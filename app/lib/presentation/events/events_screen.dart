import 'package:app/application/event/event_bloc.dart';
import 'package:app/application/event/events_event.dart';
import 'package:app/application/event/events_state.dart';
import 'package:app/presentation/events/event_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsScreen extends StatefulWidget {
  static String title = "Events";
  static String routeName = "/events";

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  EventBloc _eventsBloc;

  @override
  void initState() {
    _eventsBloc = context.read<EventBloc>()..add(FetchEventsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is FetchingEventState || state is EventStateUnInitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FetchEventStateSuccess) {
          return Container(
            child: Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,

                itemBuilder: (context, index) => EventItemWidget(
                  event: state.events[index],
                ),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      thickness: 2,
                          color: Colors.grey.shade200,
                    ),
                itemCount: state.events.length,
              ),
            ),
          );
        }
      },
    );
  }
}
