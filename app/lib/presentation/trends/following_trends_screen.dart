import 'package:app/application/trends/trends_bloc.dart';
import 'package:app/application/trends/trends_event.dart';
import 'package:app/application/trends/trends_state.dart';
import 'package:app/commons/styles.dart';
import 'package:app/commons/ui_helpers.dart';
import 'package:app/presentation/spaces/space_page_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingTrendsScreen extends StatefulWidget {
  @override
  _FollowingTrendsScreenState createState() => _FollowingTrendsScreenState();
}

class _FollowingTrendsScreenState extends State<FollowingTrendsScreen> {
  TrendsBloc _trendsBloc;

  @override
  void initState() {
    _trendsBloc = BlocProvider.of<TrendsBloc>(context)..add(FetchTrendsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendsBloc, TrendsState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is TrendsStateNotInitializedState ||
            state is FetchingTrendsState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FetchedTrendsSuccessState) {
          return ListView.separated(
            itemBuilder: (context, index) {
              var trend = state.trends[index];
              return ListTile(
                onTap: () => Navigator.pushNamed(
                    context, SpacePageScreen.routeName,
                    arguments: {"space": trend.space}),
                title: Text(
                  "Trending in ${trend.space.spaceName}",
                  style: kSubtitleTextStyle,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${trend.trendName}",
                      style: kPostTitleTextStyle,
                    ),
                    kVerticalSpaceMedium,
                    Text(
                      "${trend.noOfTopics} engagements",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_drop_down,
                  size: 25,
                ),
              );
            },
            itemCount: state.trends.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 2,
                color: Colors.grey.shade200,
              );
            },
          );
        }
      },
    );
  }
}
