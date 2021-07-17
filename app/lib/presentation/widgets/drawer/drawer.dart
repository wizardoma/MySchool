import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_event.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/application/theme/theme_cubit.dart';
import 'package:app/presentation/auth/auth_screen.dart';
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
    return SafeArea(
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is NotAuthenticatedState) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AuthScreen.routeName, (route) => false);
            });
          }
        },
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
                          onTap: () {
                            Navigator.popAndPushNamed(context, e["routeName"]);
                          },
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
                          SizedBox(
                            width: 5,
                          ),
                          Text("Settings"),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.lightbulb,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              BlocProvider.of<ThemeCubit>(context).setTheme();
                            },
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.logout,
                                color: Colors.black54,
                              ),
                              onPressed: () => context
                                  .read<AuthenticationBloc>()
                                  .add(LogoutEvent())),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
