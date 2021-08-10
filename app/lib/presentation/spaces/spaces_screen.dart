import 'package:app/application/space/spaces_bloc.dart';
import 'package:app/application/space/spaces_state.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/domain/space/space.dart';
import 'package:app/presentation/spaces/space_page_screen.dart';
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
        if (state is SpaceStateUnInitialized || state is FetchingSpaceState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FetchSpaceStateSuccess ||
            _spaceBloc.userSpaces.isNotEmpty) {
          List<Space> spaces = _spaceBloc.userSpaces;
          return Expanded(
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
    ]));
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
