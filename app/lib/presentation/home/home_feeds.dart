import 'package:app/application/homefeeds/home_feeds_bloc.dart';
import 'package:app/application/homefeeds/homefeeds_event.dart';
import 'package:app/application/homefeeds/homefeeds_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeeds extends StatefulWidget {
  static const title = "Home";

  @override
  _HomeFeedsState createState() => _HomeFeedsState();
}

class _HomeFeedsState extends State<HomeFeeds> {
  HomeFeedsBloc _feedsBloc;

  @override
  void initState() {
    _feedsBloc = context.read<HomeFeedsBloc>()..add(FetchHomeFeedsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_feedsBloc);
    return BlocBuilder<HomeFeedsBloc, HomeFeedsState>(
        // ignore: missing_return
        builder: (context, state) {
          print(state);
      if (state is FetchingHomeFeedsState ||
          state is HomeFeedsUnInitializedState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is FetchHomeFeedsSuccessState) {
        return Container(
          child: Text(state.feeds.length.toString()),
        );
      }
    });
  }
}
