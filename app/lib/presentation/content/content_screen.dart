import 'package:app/application/notification/notification_bloc.dart';
import 'package:app/application/notification/notifications_event.dart';
import 'package:app/application/notification/notifications_state.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ContentsScreen extends StatefulWidget {
  static const String routeName = "/content";

  @override
  _ContentsScreenState createState() => _ContentsScreenState();
}

class _ContentsScreenState extends State<ContentsScreen> {
  NotificationBloc _notificationBloc;

  @override
  void initState() {
    _notificationBloc = context.read<NotificationBloc>()
      ..add(FetchNotificationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Content",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black54,
        ),
        leadingWidth: 30,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Content",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text("Filter"),
                        kHorizontalSpaceTiny,
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              BlocBuilder<NotificationBloc, NotificationState>(
                // ignore: missing_return
                builder: (context, state) {
                  if (state is NotificationStateUnInitialized ||
                      state is FetchingNotificationState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FetchNotificationStateSuccess) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (c, i) => Divider(
                          color: Colors.grey.shade200,
                          thickness: 0.5,
                        ),
                        padding: EdgeInsets.zero,

                        itemBuilder: (context, index) {
                          var notification = state.notifications[index];
                          return ListTile(
                            title: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                notification.postTitle,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 15),
                              ),
                            ),
                            subtitle: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: notification.spaceName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                    text:
                                        " ${notification.isPost ? " Posted " : " Asked "} ${DateFormat('MMM d, y').format(notification.date)}",
                                    style: TextStyle(color: Colors.grey))
                              ]),
                            ),
                          );
                        },
//
                        itemCount: state.notifications.length ~/ 2,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
