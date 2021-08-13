import 'package:app/application/space/spaces_bloc.dart';
import 'package:app/application/space/spaces_state.dart';
import 'package:app/commons/api.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/space/space.dart';
import 'package:app/presentation/spaces/space_page_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpacesScreen extends StatefulWidget {
  static const title = "Spaces";

  SpacesScreen({Key key}) : super(key: key);

  @override
  _SpacesScreenState createState() => _SpacesScreenState();
}

class _SpacesScreenState extends State<SpacesScreen> {
  SpaceBloc _spaceBloc;

  @override
  void initState() {
    _spaceBloc = context.read<SpaceBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: EdgeInsets.all(defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Your Spaces",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            kVerticalSpaceSmall,
            Row(
              children: [
                Container(
//                  height: 40,
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultSpacing * 0.5,
                      vertical: defaultSpacing * 0.5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      kHorizontalSpaceTiny,
                      Text(
                        "Create",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
                kHorizontalSpaceSmall,
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultSpacing * 0.5,
                      vertical: defaultSpacing * 0.5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        child: Icon(
                          Icons.search,
                          size: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      kHorizontalSpaceTiny,
                      Text(
                        "Discover",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      kVerticalSpaceSmall,
      BlocBuilder<SpaceBloc, SpaceState>(
          // ignore: missing_return
          builder: (ctx, state) {
        if (state is SpaceStateUnInitialized || state is SpaceLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FetchSpaceStateSuccess ||
            _spaceBloc.userSpaces.isNotEmpty) {
          List<Space> spaces = _spaceBloc.userSpaces;
          if (spaces.length == 0) {
            return Center(
              child: Text("You have not joined any spaces"),
            );
          }
          return Flexible(
              child: ListView.separated(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey.shade200,
              thickness: 0.5,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, SpacePageScreen.routeName,
                  arguments: {
                    "space": spaces[index],
                  }),
              child: CustomListTile(
                leading: Image.asset("assets/images/group_task.png",
                    width: 20, height: 20),
                title: Text(
                  spaces[index].spaceName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            itemCount: spaces.length,
          ));
        }
      }),
      kVerticalSpaceRegular,
      Container(
        padding: EdgeInsets.all(defaultSpacing),
        height: 300,
        child: LayoutBuilder(
          builder: (context, cons) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover Spaces",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kVerticalSpaceRegular,
                Expanded(
                  child: FutureBuilder(
                      future: _fetchSpaces(),
                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<Space> spaces = snapshot.data;
                          return Container(
                            height: 200,
                            child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: List.generate(spaces.length, (index) {
                                  return GestureDetector(
                                    onTap: () => Navigator.pushNamed(context, SpacePageScreen.routeName, arguments: {"space": spaces[index]}),
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: cons.maxWidth,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  topLeft: Radius.circular(15),
                                                ),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              height: 160,
                                              padding:
                                                  EdgeInsets.all(defaultSpacing),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${spaces[index].spaceName}",
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  kVerticalSpaceSmall,
                                                  Text(
                                                      "${spaces[index].description}" , style: TextStyle(fontSize: 12,),softWrap: true,)
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                          );
                        }
                      }),
                )
              ],
            );
          },
        ),
      ),
    ]));
  }
}

Future<List<Space>> _fetchSpaces() async {
  Response response;
  try {
    response = await dioClient.get(
      "/spaces",
    );

    List<Space> spaces = [];

    response.data["data"].forEach((post) {
      spaces.add(Space.fromServer(post));
    });

    return spaces;
  } catch (e) {
    print(e);
  }
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget title;

  const CustomListTile({Key key, this.leading, this.trailing, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
      padding: EdgeInsets.symmetric(
          horizontal: defaultSpacing, vertical: defaultSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                leading,
                kHorizontalSpaceSmall,
                title,
              ],
            ),
          ),
          Container(
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
