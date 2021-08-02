import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/event/event.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatefulWidget {
  static const routeName = "/event-detail";

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  Event _event;

  var hasRun = false;

  @override
  void didChangeDependencies() {
    if (!hasRun) {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      _event = arguments["event"];
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text(_event.name),
            expandedHeight: mediaQuery.height * 0.4,
            pinned: true,
            snap: false,
            floating: false,
            backgroundColor: Colors.black87,
            flexibleSpace: FlexibleSpaceBar(
              background: LayoutBuilder(
                builder: (c, con) => Container(
                  height: con.maxHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        _event.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.all(
                defaultSpacing,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _event.name,
                    style: kPostTitleTextStyle,
                  ),
                  kVerticalSpaceRegular,
                  Text(
                    "by ${_event.organizer}",
                    style: TextStyle(color: Colors.grey),
                  ),
                  kVerticalSpaceRegular,
                  Text(
                    "${_event.noOfGoings} going",
                    style: kSubtitleTextStyle,
                  ),
                ],
              ),
            ),
            kVerticalSpaceSmall,
            Divider(),
            kVerticalSpaceRegular,
            ListTile(
              leading: Icon(
                Icons.date_range_outlined,
                color: Colors.grey,
              ),
              title: Text(
                "Date and Time",
              ),
              subtitle: Text(
                _event.date,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              ),
              title: Text(
                "Location",
              ),
              subtitle: Text(
                _event.location,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.date_range_outlined,
                color: Colors.grey,
              ),
              title: Text(
                "Description",
              ),
              subtitle: Text(
                _event.description,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ]))
        ],
      ),
      bottomNavigationBar: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(
          defaultSpacing,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  _event.price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(defaultSpacing * 0.5),
                ),
              ),
              child: Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
