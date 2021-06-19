import 'package:app/application/theme/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {

  final _items = [
    {
      "icon": Icons.message_outlined,
      "title": "Messages",
      "routeName": "/messages",
    },
    {
      "icon": Icons.insert_chart_outlined,
      "title": "Stats",
      "routeName": "/stats",
    },
    {
      "icon": Icons.book_outlined,
      "title": "Your content",
      "routeName": "/content",
    },
    {
      "icon": Icons.bookmark_border,
      "title": "Bookmarks",
      "routeName": "/bookmarks",
    },
    {
      "icon": Icons.drafts_outlined,
      "title": "Drafts",
      "routeName": "/drafts",
    }
  ];

  @override
  Widget build(BuildContext context) {
    var mQ = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  child: DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/icons/student.png"),
                        ),
                        ListTile(
                          title: Text(
                            "Alexander Ibekason",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: _items.map((e) {
                      return ListTile(
                        leading: Icon(e["icon"]),
                        title: Text(e["title"]),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.settings_outlined),
                        SizedBox(width: 5,),
                        Text("Settings"),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.lightbulb, color: Colors.black54,),
                          onPressed: () {
                            BlocProvider.of<ThemeCubit>(context).setTheme();
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.more_horiz, color: Colors.black54,), onPressed: null),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
