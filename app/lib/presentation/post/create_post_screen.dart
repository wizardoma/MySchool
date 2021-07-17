import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/presentation/widgets/post_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  static List<String> _postTypeOptions = ["Create Post", "Add a question"];
  var _postType = _postTypeOptions[0];
  String _postHintText =
      "Post about studies, your activities, useful academic insights etc.";
  String _questionHintText =
      "Start your question with \"What\", \"Why\", \"How\", etc. ";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        child: PostBottomSheet(
          headerTitle: DropdownButton(
            iconSize: 30,
            underline: SizedBox(),
            iconEnabledColor: Colors.grey,
            hint: Text(_postType),
            onChanged: (s) {
              setState(() {
                _postType = s.toString();
              });
            },
            items: _postTypeOptions
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
          title: "Add",
          body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage("assets/icons/student.png"),
                    ),
                    kHorizontalSpaceTiny,
                    Text(
                      "Alexander Ibekason ${!isPost() ? "Asked" : "Posted"}",
                      style: kSubtitleTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                kVerticalSpaceMedium,
                TextField(
                  minLines: 2,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      hintText: isPost() ? _postHintText : _questionHintText,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isPost() {
    return _postTypeOptions.indexOf(_postType) == 0;
  }
}
