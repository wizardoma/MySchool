import 'package:app/application/notification/notification_bloc.dart';
import 'package:app/application/notification/notifications_event.dart';
import 'package:app/application/notification/notifications_state.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/presentation/notifications/notification_item.dart';
import 'package:app/presentation/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  static const title = "Notifications";

  static const String routeName= "/notifications";

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
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        elevation: 0.5,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Image.asset(
              "assets/icons/student.png",
              width: 45,
              height: 45,
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        title: Text(
          "Notifications",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black87,
              size: 30,
            ),
            onPressed: null,
          ),
          kHorizontalSpaceTiny,
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black87,
            ),
          )
        ],
      ),


      body: BlocBuilder<NotificationBloc, NotificationState>(
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
                    padding: EdgeInsets.all(defaultSpacing ),
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
      ),
    );
  }
}
