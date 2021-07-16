import 'package:app/application/notification/notification_bloc.dart';
import 'package:app/application/notification/notifications_event.dart';
import 'package:app/application/notification/notifications_state.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/presentation/notifications/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  static const title = "Notifications";

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationBloc _notificationBloc;

  @override
  void initState() {
    _notificationBloc = context.read<NotificationBloc>()
      ..add(FetchNotificationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is NotificationStateUnInitialized ||
            state is FetchingNotificationState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FetchNotificationStateSuccess) {
          return Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mark All As Read", style: TextStyle(color: Colors.black87, fontSize: 16),),
                      Row(
                        children: [
                          Icon(Icons.show_chart, color: Colors.black87,),
                          kHorizontalSpaceSmall,
                          Icon(Icons.settings_outlined, color: Colors.black87,),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,

                    itemBuilder: (context, index) => Container(

                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                        color: state.notifications[index].isRead ? Colors.grey.shade200 : Colors.white,
                      ),

                      child: NotificationItem(
                          notification: state.notifications[index]),
                    ),
//                    separatorBuilder: (BuildContext context, int index) =>
//                        Divider(
//                      thickness: 1,
//                    ),
                    itemCount: state.notifications.length,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
