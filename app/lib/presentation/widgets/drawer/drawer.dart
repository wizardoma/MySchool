import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_event.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/application/theme/theme_cubit.dart';
import 'package:app/application/user/user_bloc.dart';
import 'package:app/application/user/user_state.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/presentation/auth/auth_screen.dart';
import 'package:app/presentation/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

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
                  Container(child:
                      DrawerHeader(child: BlocBuilder<UserBloc, UserState>(
                          // ignore: missing_return
                          builder: (context, state) {
                    if (state is UserNotInitializedState ||
                        state is FetchingUserState) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer(
                              child: CircleAvatar(
                                radius: 40,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey,
                                  Colors.grey.shade300,
                                ],
                              ),
                            ),
                            kVerticalSpaceSmall,
                            Shimmer(
                              child: Container(
                                height: 30,
                                width: double.infinity,
                                child: LayoutBuilder(
                                  builder: (c, cn) => Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: cn.maxWidth * 0.4,
                                        color: Colors.grey,
                                      ),
                                      kHorizontalSpaceTiny,
                                      Container(
                                        height: 30,
                                        width: cn.maxWidth * 0.55,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
//                              color: Colors.grey,
                              ),
                              gradient: LinearGradient(colors: [
                                Colors.grey,
                                Colors.grey.shade300,
                              ]),
                            )
                          ]);
                    }
                    if (state is FetchUserErrorState){
                      return Center(
                        child: Text(state.errorMessage),
                      );
                    }
                    if (state is FetchedUserState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                "assets/icons/profile_photo.jpg",
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () => Navigator.popAndPushNamed(
                              context,
                              ProfileScreen.routeName,
                              arguments: {
                                "user": state.user,
                              },
                            ),
                            title: Text(
                              state.user.name,
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
                          ),
                        ],
                      );
                    }
                  }))),
                  Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: _items.map((e) {
                        return ListTile(
                          onTap: () {
                            Navigator.popAndPushNamed(context, e["routeName"]);
                          },
                          leading: Icon(
                            e["icon"],
                            color: Colors.black87,
                          ),
                          title: Text(
                            e["title"],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultSpacing * 0.5,
                    vertical: defaultSpacing * 0.3),
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
