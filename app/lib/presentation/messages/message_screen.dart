import 'package:app/commons/styles.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  static const String routeName = "/messages";

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<Map<String, dynamic>> _messages = [
    {
      "name": "Ibekason Alexander Onyebuchi",
      "message": "Can you help me with our assignments?",
      "time": "6m ago",
    },
    {
      "name": "Victor Emeka",
      "message": "I got the information from my lectures",
      "time": "1 hour ago",
    },
    {
      "name": "Goodness Okolie",
      "message": "You have to come today",
      "time": "1 day ago",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(
          "Messages",
          style: TextStyle(color: Colors.black87),
        ),
        leading: BackButton(
          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        separatorBuilder: (c, i) => Divider(
          color: Colors.grey.shade200,
          thickness: 0.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              _messages[index]["name"],
              style: kPostTitleTextStyle.copyWith(fontSize: 14),
              maxLines: 1,
            ),
            subtitle: Text(_messages[index]["message"]),
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/student.png")),
                shape: BoxShape.circle,
              ),
            ),
            trailing: Text(
              "6m ago",
              style: kSubtitleTextStyle,
            ),
          );
        },
        itemCount: _messages.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.send),
      ),
    );
  }
}
