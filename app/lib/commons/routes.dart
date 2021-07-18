import 'package:app/presentation/auth/auth_screen.dart';
import 'package:app/presentation/bookmarks/bookmark_screen.dart';
import 'package:app/presentation/content/content_screen.dart';
import 'package:app/presentation/draft/draft_screen.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:app/presentation/messages/message_screen.dart';
import 'package:app/presentation/profile/profile_screen.dart';
import 'package:app/presentation/spaces/space_page_screen.dart';
import 'package:app/presentation/widgets/post_view_screen.dart';
import 'package:flutter/material.dart';

/// author: Ibekason Alexander
/// Handles application routes

Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.routeName: (_) => HomeScreen(),
  AuthScreen.routeName: (_) => AuthScreen(),
  PostViewScreen.routeName: (_) => PostViewScreen(),
  DraftScreen.routeName: (_) => DraftScreen(),
  BookMarkScreen.routeName: (_) => BookMarkScreen(),
  ContentsScreen.routeName: (_) => ContentsScreen(),
  MessagesScreen.routeName: (_) => MessagesScreen(),
  ProfileScreen.routeName: (_) => ProfileScreen(),
  SpacePageScreen.routeName: (_) => SpacePageScreen(),
};
