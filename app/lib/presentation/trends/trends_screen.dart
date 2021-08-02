import 'package:app/commons/ui_helpers.dart';
import 'package:app/presentation/trends/all_trending_screen.dart';
import 'package:app/presentation/trends/following_trends_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingScreen extends StatefulWidget {
  static var title = "Trends";

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TabBar(
//                isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "For you",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Trending",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          kVerticalSpaceRegular,
          Expanded(
            child: TabBarView(
              children: [
                FollowingTrendsScreen(),
                AllTrendingScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
