import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/event/event.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  final Event event;

  const EventItemWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    event.imageUrl,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.all(
              defaultSpacing,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: kPostTitleTextStyle,
                ),
                kVerticalSpaceRegular,
                Text(
                  event.date,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                kVerticalSpaceRegular,
                Text(
                  event.location,
                  style: kSubtitleTextStyle,
                ),
                kVerticalSpaceSmall,
                Text(
                  event.price,
                ),
                kVerticalSpaceRegular,
                Text(
                  event.organizer,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                kVerticalSpaceRegular,
                Text(
                  "${event.noOfGoings} going",
                  style: kSubtitleTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
