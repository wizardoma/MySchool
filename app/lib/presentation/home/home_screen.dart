import 'package:app/commons/ui_helpers.dart';
import 'package:app/presentation/events/events_screen.dart';
import 'package:app/presentation/home/home_feeds.dart';
import 'package:app/presentation/notifications/notifications_screen.dart';
import 'package:app/presentation/post/create_post_screen.dart';
import 'package:app/presentation/questions/questions_screen.dart';
import 'package:app/presentation/spaces/spaces_screen.dart';
import 'package:app/presentation/trends/trends_screen.dart';
import 'package:app/presentation/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageTitle = [
    HomeFeeds.title,
    TrendingScreen.title,
    QuestionScreen.title,
    SpacesScreen.title,
    EventsScreen.title
  ];

  int _currNavIndex = 0;
  List<Widget> _children;

  void _openDrawer(BuildContext ctx) {
    Scaffold.of(ctx).openDrawer();
  }

  @override
  void initState() {
    _children = [
      HomeFeeds(),
      TrendingScreen(),
      QuestionScreen(),
      SpacesScreen(),
      EventsScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _currNavIndex <= 2,
        child: FloatingActionButton(
          onPressed: onFabTapped,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: HomeDrawer(),
      appBar: AppBar(
        elevation: 0.5,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => _openDrawer(context),
            child: Image.asset(
              "assets/icons/student.png",
              width: 45,
              height: 45,
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        title: Text(
          _pageTitle[_currNavIndex],
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black87,
              size: 30,
            ),
            onPressed: null,
          ),
          kHorizontalSpaceTiny,
          IconButton(
            onPressed: _goToNotifications,
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black87,
            ),
          )
        ],
      ),
      bottomNavigationBar: getNavBar(),
      body: IndexedStack(
        children: _children,
        index: _currNavIndex,
      ),
    );
  }

  BottomNavigationBar getNavBar() {
    return BottomNavigationBar(
        currentIndex: _currNavIndex,
        onTap: (index) {
          setState(() {
            _currNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            icon: getIcon(
              Icons.home_outlined,
            ),
            activeIcon: getIcon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: getIcon(Icons.insert_chart),
            icon: getIcon(Icons.insert_chart_outlined),
            label: "Trending",
          ),
          BottomNavigationBarItem(
            activeIcon: getIcon(Icons.post_add),
            icon: getIcon(Icons.post_add_outlined),
            label: "Answer",
          ),
          BottomNavigationBarItem(
            activeIcon: getIcon(Icons.people),
            icon: getIcon(Icons.people_outline),
            label: "Spaces",
          ),
          BottomNavigationBarItem(
            activeIcon: getIcon(Icons.calendar_view_week),
            icon: getIcon(Icons.calendar_view_week),
            label: "Events",
          ),
        ]);
  }

  Icon getIcon(IconData icon) {
    return Icon(icon, size: 25,);
  }

  void onFabTapped() {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (context) => CreatePostScreen(),
    );
  }

  void _goToNotifications() {
    Navigator.pushNamed(context, NotificationScreen.routeName);
  }
}
