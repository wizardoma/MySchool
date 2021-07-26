import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/posts/post.dart';
import 'package:app/domain/space/space.dart';
import 'package:app/presentation/questions/question_item.dart';
import 'package:app/presentation/widgets/post_container.dart';
import 'package:flutter/material.dart';

class SpacePageScreen extends StatefulWidget {
  static const routeName = "/space-page";

  @override
  _SpacePageScreenState createState() => _SpacePageScreenState();
}

class _SpacePageScreenState extends State<SpacePageScreen>
    with SingleTickerProviderStateMixin {
  Space _space;

  var hasRun = false;

  static List<String> _tabs = [
    "About",
    "Posts",
    "Questions",
  ];
  var isExpanded = false;

  var _currIndex = 1;

  TabController _tabbarController;

  @override
  void didChangeDependencies() {
    if (!hasRun) {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      _space = arguments["space"];
      super.didChangeDependencies();
    }
  }

  @override
  void initState() {
    _tabbarController =
        TabController(length: 3, vsync: this, initialIndex: _currIndex)
          ..addListener(() {
            setState(() {
              _currIndex = _tabbarController.index;
            });
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var tabBar = TabBar(
      labelColor: Colors.black54,
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
      controller: _tabbarController,
    );
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: _detectUserSwipe,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: BackButton(
                  color: Colors.white,
                ),
                title: Visibility(
                  visible: !isExpanded,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_space.spaceName),
                      kVerticalSpaceTiny,
                      Text(
                        "${_space.users.length} Contributors",
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
                expandedHeight: mediaQuery.height * 0.47,
                pinned: true,
                snap: false,
                floating: false,
                bottom: PreferredSize(
                  preferredSize: tabBar.preferredSize,
                  child: ColoredBox(
                    color: Colors.white,
                    child: Container(
                      width: mediaQuery.width,
                      child: tabBar,
                    ),
                  ),
                ),
                backgroundColor: Colors.black87,
                flexibleSpace: FlexibleSpaceBar(
                  background: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
//                        height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(_space.imageUrl),
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
                              padding: EdgeInsets.only(
                                  left: defaultSpacing * 0.5, right: defaultSpacing * 0.5, bottom: defaultSpacing * 0.5),
                              child: Column(
                                children: [
                                  Container(
                                    constraints: BoxConstraints.expand(
                                        height: 80, width: mediaQuery.width),
                                    child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            top: -20,
                                            child: Container(
                                              height: 65,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        _space.imageUrl)),
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: null,
                                                      icon: Icon(
                                                        Icons
                                                            .notifications_off_outlined,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    kHorizontalSpaceSmall,
                                                    Container(
                                                      height: 40,
                                                      padding:
                                                          EdgeInsets.all(defaultSpacing * 0.5),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        color: Colors.black54,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Following",
                                                          ),
//                                                  kHorizontalSpaceTiny,
                                                          FittedBox(
                                                            child: Column(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                kVerticalSpaceTiny
                                                              ],
                                                            ),
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
                                      vertical: defaultSpacing * 0.5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _space.spaceName,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        kVerticalSpaceTiny,
                                        Text(
                                          _space.about,
                                          style: TextStyle(height: 1.3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DefaultTextStyle(
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: defaultSpacing * 0.5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${_space.noOfFollowers} followers",
                                          ),
                                          kHorizontalSpaceSmall,
                                          Text(
                                            "${_space.noOfPostsInAWeek} posts today",
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
//                      Expanded(
//                        child: Container(
////                          height: 50,
//                          width: mediaQuery.width,
//                          color: Colors.white,
//                          child:
//                        ),
//                      ),
                      ],
                    );
                  }),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    if (_currIndex == 0)
                      Container(
                        padding: EdgeInsets.all(defaultSpacing),
                        child: Text(
                          _space.about,
                        ),
                      ),
                    if (_currIndex == 1) ..._spacePosts(),
                    if (_currIndex == 2) ..._spaceQuestions(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _spacePosts() {
    return List.generate(
        _space.posts.length,
        (index) => PostContainer(
              post: _space.posts[index],
            ));
  }

  List<Widget> _spaceQuestions() {
    return List.generate(
        _space.questions.length,
        (index) => QuestionItem(
              question: _space.questions[index],
            ));
  }

  void _detectUserSwipe(DragEndDetails details) {
    if (details.primaryVelocity > 0) {
      print("current index on left swipe $_currIndex");
      if (_currIndex >= 1) {
        setState(() {
          _tabbarController.index = --_currIndex;
        });
      }
    } else if (details.primaryVelocity < 0) {
      print("current index on right swipe $_currIndex");

      if (_currIndex <= 1) {
        _tabbarController.index = ++_currIndex;
      }
    }
  }
}
