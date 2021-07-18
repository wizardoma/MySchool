import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/posts/post.dart';
import 'package:app/domain/user/user.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profile";

  ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _currIndex = 0;
  User _user;

  static List<Widget> _tabChildren = List.generate(
      5,
      (index) => Container(
            child: Center(
              child: Text(_tabs[index]),
            ),
          ));

  static List<Map<String, dynamic>> _profileButtons = [
    {
      "icon": Icons.person_add_outlined,
      "title": "Follow",
    },
    {"icon": Icons.doorbell_outlined, "title": "Notify me"},
    {
      "icon": Icons.question_answer_outlined,
      "title": "Ask",
    },
    {"icon": Icons.more_horiz_outlined, "title": "More"}
  ];

  static List<String> _tabs = [
    "Profile",
    "12 Answers",
    "3 Question",
    "3 Shares",
    "O Posts"
  ];

  var hasRun = false;

  @override
  void didChangeDependencies() {
    if (!hasRun) {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      print("Args $arguments");
      _user = arguments["user"];
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black87,
        ),
      ),
      body: Container(
        child: ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (c, l) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: l.maxWidth * 0.3,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("assets/icons/student.png"),
                          ),
                        ),
                        kHorizontalSpaceSmall,
                        Container(
                          width: l.maxWidth * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: FittedBox(
                                  child: Text(
                                    _user.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                              kVerticalSpaceSmall,
                              Container(
                                child: Text(
                                  "${_user.department} Student of ${_user.university}",
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  kVerticalSpaceSmall,
                  Container(
                    child: Text(
                      postBodyShort,
                      style: TextStyle(height: 1.3),
                    ),
                  ),
                  kVerticalSpaceTiny,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _profileButtons.map((p) {
                          return profileButton(
                            icon: p["icon"],
                            title: p["title"],
                          );
                        }).toList()),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 4,
              color: Colors.grey.shade300,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Credentials & Highlights",
                          style: kPostTitleTextStyle,
                        ),
                        Text(
                          "More",
                          style: kSubtitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        minVerticalPadding: 0,
                        leading: Icon(Icons.people_outline),
                        title: Text(
                          _user.department,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.room_outlined),
                        title: FittedBox(child: Text(_user.university)),
                      ),
                      ListTile(
                        leading: Icon(Icons.confirmation_num),
                        title: Text(getLevel()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 4,
              color: Colors.grey.shade300,
            ),
            Container(
              constraints: BoxConstraints.expand(
                  height: 400, width: MediaQuery.of(context).size.width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTabController(
                    length: 5,
                    child: Builder(
                      builder: (context) {
                        return Expanded(
                          child: Column(
                            children: [
                              TabBar(
                                  onTap: (index) => setState(() {
                                        _currIndex = index;
                                      }),
                                  tabs: _tabs
                                      .map(
                                        (e) => Tab(
                                          child: FittedBox(
                                              child: Text(
                                            e,
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 12,
                                            ),
                                            maxLines: 1,
                                          )),
                                        ),
                                      )
                                      .toList()),
                              Expanded(
                                child: TabBarView(
                                  children: _tabChildren,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileButton({IconData icon, String title}) {
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.black54,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }

  String getLevel() => int.tryParse(_user.level) == null
      ? _user.level + " student"
      : "${_user.level} level";
}
