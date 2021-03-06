import 'package:app/application/space/space_crud_cubit.dart';
import 'package:app/application/space/spaces_bloc.dart';
import 'package:app/application/space/spaces_event.dart';
import 'package:app/application/space/spaces_state.dart';
import 'package:app/commons/api.dart';
import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/space/space.dart';
import 'package:app/presentation/events/event_item_widget.dart';
import 'package:app/presentation/questions/question_item.dart';
import 'package:app/presentation/widgets/post_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpacePageScreen extends StatefulWidget {
  static const routeName = "/space-page";

  @override
  _SpacePageScreenState createState() => _SpacePageScreenState();
}

class _SpacePageScreenState extends State<SpacePageScreen>
    with SingleTickerProviderStateMixin {
  Space _space;

  String _followText = "Follow +";

  var hasRun = false;

  static List<String> _tabs = ["About", "Posts", "Questions", "Events"];
  var isExpanded = false;

  var _currIndex = 1;

  TabController _tabbarController;

  @override
  void didChangeDependencies() {
    if (!hasRun) {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      _space = arguments["space"];
      context.read<SpaceCrudCubit>().fetchSpaceById(_space.id);
      super.didChangeDependencies();
    }
  }

  @override
  void initState() {
    _tabbarController =
        TabController(length: 4, vsync: this, initialIndex: _currIndex)
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
          child: BlocBuilder<SpaceCrudCubit, SpaceState>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is SpaceLoadingState ||
                  state is SpaceStateUnInitialized) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is FetchSingleSpaceFailureState) {
                return Center(
                  child: Text("An error occurred fetching space"),
                );
              }
              if (state is FetchSingleSpaceSuccessState) {
                Space space = state.space;
                return CustomScrollView(
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
                            Text(space.spaceName),
                            kVerticalSpaceTiny,
                            Text(
                              "${space.users.length} Contributors",
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
                                    image: NetworkImage(space.imageUrl),
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
                                        left: defaultSpacing,
                                        right: defaultSpacing,
                                        bottom: defaultSpacing),
                                    child: Column(
                                      children: [
                                        Container(
                                          constraints: BoxConstraints.expand(
                                              height: 80,
                                              width: mediaQuery.width),
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
                                                              space.imageUrl)),
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          kHorizontalSpaceSmall,
                                                          GestureDetector(
                                                            onTap: _followSpace,
                                                            child: Container(
                                                              height: 40,
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      defaultSpacing *
                                                                          0.5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white),
                                                                color: Colors
                                                                    .black54,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    _followText,
                                                                  ),
//                                                  kHorizontalSpaceTiny,
                                                                ],
                                                              ),
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
                                                space.spaceName,
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              kVerticalSpaceTiny,
                                              Text(
                                                space.description,
                                                style: TextStyle(height: 1.3),
                                              ),
                                            ],
                                          ),
                                        ),
                                        DefaultTextStyle(
                                          style: TextStyle(
                                              color: Colors.grey.shade400),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: defaultSpacing * 0.5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${space.noOfFollowers} followers",
                                                ),
                                                kHorizontalSpaceSmall,
                                                Text(
                                                  "${space.noOfPostsInAWeek} posts today",
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
                                space.description,
                              ),
                            ),
                          if (_currIndex == 1) ..._spacePosts(),
                          if (_currIndex == 2) ..._spaceQuestions(),
                          if (_currIndex == 3) ..._spaceEvents(),
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _followSpace() async {
    Response response;
    try {
      response = await dioClient.post(
        "/spaces/${_space.id}",
      );

      var space = Space.fromServer(response.data["data"]);
      return space;
    } catch (e) {
      print("Exception $e");
    }
  }

  Future<Space> _fetchSpace() async {
    Response response;
    try {
      response = await dioClient.get(
        "/spaces/${_space.id}",
      );

      var space = Space.fromServer(response.data["data"]);
      return space;
    } catch (e) {
      print("Exception $e");
    }
  }

  List<Widget> _spacePosts() {
    return _space.posts.length == 0
        ? [
            Center(
              child: Text("No Posts, be the first to create a post"),
            )
          ]
        : List.generate(
            _space.posts.length,
            (index) => PostContainer(
                  post: _space.posts[index],
                ));
  }

  List<Widget> _spaceEvents() {
    return List.generate(
      _space.events.length,
      (index) => EventItemWidget(
        event: _space.events[index],
      ),
    );
  }

  List<Widget> _spaceQuestions() {
    return List.generate(
        _space.questions.length,
        (index) => QuestionItem(
              question: _space.posts[index],
            ));
  }

  void _detectUserSwipe(DragEndDetails details) {
    if (details.primaryVelocity > 0) {
      if (_currIndex >= 1) {
        setState(() {
          _tabbarController.index = --_currIndex;
        });
      }
    } else if (details.primaryVelocity < 0) {
      if (_currIndex <= 2) {
        _tabbarController.index = ++_currIndex;
      }
    }
  }
}
