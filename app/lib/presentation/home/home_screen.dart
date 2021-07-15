import 'package:app/presentation/follows/following_screen.dart';
import 'package:app/presentation/home/home_feeds.dart';
import 'package:app/presentation/notifications/notifications_screen.dart';
import 'package:app/presentation/questions/questions_screen.dart';
import 'package:app/presentation/spaces/spaces_screen.dart';
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
    FollowingScreen.title,
    QuestionScreen.title,
    SpacesScreen.title,
    NotificationScreen.title
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
      FollowingScreen(),
      QuestionScreen(),
      SpacesScreen(),
      NotificationScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_currNavIndex);
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _currNavIndex <=2,
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
          builder:(context)=> GestureDetector(
            onTap:() =>_openDrawer(context),
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
        ],
      ),
      bottomNavigationBar: getNavBar(),
      body: _children[_currNavIndex],
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
            label: "Following",
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
            activeIcon: getIcon(Icons.notifications),
            icon: getIcon(Icons.notifications_outlined),
            label: "Notifications",
          ),
        ]);
  }

  Icon getIcon(IconData icon) {
    return Icon(icon, size: 25);
  }

  void onFabTapped() {
    print("Fab typed");
  }
}
