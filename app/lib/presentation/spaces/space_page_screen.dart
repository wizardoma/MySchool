import 'dart:math';

import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/posts/post.dart';
import 'package:flutter/material.dart';

class SpacePageScreen extends StatefulWidget {
  static const routeName = "/space-page";

  @override
  _SpacePageScreenState createState() => _SpacePageScreenState();
}

class _SpacePageScreenState extends State<SpacePageScreen> {
  static List<String> _tabs = [
    "About",
    "Posts",
    "Questions",
  ];
  var isExpanded = false;

  var _currIndex = 1;
  static List<Widget> _tabChildren = List.generate(
      3,
      (index) => Container(
            child: Center(
              child: Text(_tabs[index]),
            ),
          ));

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: BackButton(
                color: Colors.black87,
              ),
              title: Visibility(
                visible: !isExpanded,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Computer Science"),
                    kVerticalSpaceTiny,
                    Text(
                      "191 Contributors",
                      style: kSubtitleTextStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.notifications_off_outlined,
                      color: Colors.white),
                ),
              ],
              expandedHeight: mediaQuery.height * 0.45,
              pinned: true,
              snap: true,
              floating: true,
              backgroundColor: Colors.black87,
              flexibleSpace: FlexibleSpaceBar(
                background: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              imageUrls[Random().nextInt(imageUrls.length)]),
                        ),
                      ),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.85),
                          ),
                          margin: EdgeInsets.only(
                            top: kToolbarHeight * 2,
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Column(children: [
                            Container(
                              constraints: BoxConstraints.expand(
                                  height: 80, width: mediaQuery.width),
                              child: Stack(clipBehavior: Clip.none, children: [
                                Positioned(
                                  top: -20,
                                  child: Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/myschool_landing.jpg")),
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Spacer(),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: null,
                                            icon: Icon(
                                              Icons.notifications_off_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                          kHorizontalSpaceSmall,
                                          Container(
                                            height: 40,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              color: Colors.black54,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            alignment: Alignment.center,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Following",
                                                ),
                                                kHorizontalSpaceTiny,
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Computer Science",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  kVerticalSpaceTiny,
                                  Text(
                                    "Computer Science Space | Posts, questions and Ideas on Computer Science",
                                    style: TextStyle(height: 1.3),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "1902 followers",
                                  ),
                                  kHorizontalSpaceSmall,
                                  Text(
                                    "17 posts today",
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ));
                }),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTabController(
                    length: 3,
                    initialIndex: _currIndex,
                    child: Builder(
                      builder: (context) {
                        return Container(
                          constraints: BoxConstraints.expand(
                              height: 1000, width: mediaQuery.width),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                        )),
                                      ),
                                    )
                                    .toList(),
                                isScrollable: true,
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: _tabChildren,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
