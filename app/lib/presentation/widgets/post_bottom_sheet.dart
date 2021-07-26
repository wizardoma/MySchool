import 'package:app/commons/ui_helpers.dart';
import 'package:flutter/material.dart';

class PostBottomSheet extends StatefulWidget {
  final String title;
  final Widget headerTitle;
  final Widget body;

  const PostBottomSheet(
      {Key key, @required this.title, @required this.headerTitle, this.body})
      : super(key: key);

  @override
  _PostBottomSheetState createState() => _PostBottomSheetState();
}

class _PostBottomSheetState extends State<PostBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(defaultSpacing * 0.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CloseButton(
                      color: Colors.black54,
                    ),
                    if (widget.headerTitle != null) widget.headerTitle,
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: defaultSpacing * 0.5, horizontal: defaultSpacing),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          kVerticalSpaceSmall,
          widget.body,
        ],
      ),
    );
  }
}
