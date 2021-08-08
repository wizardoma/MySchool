import 'package:app/application/post/posts_bloc.dart';
import 'package:app/application/post/posts_event.dart';
import 'package:app/application/post/post_state.dart';
import 'package:app/presentation/widgets/post_container.dart';
import 'package:app/presentation/widgets/post_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeeds extends StatefulWidget {
  static const title = "Home";

  @override
  _HomeFeedsState createState() => _HomeFeedsState();
}

class _HomeFeedsState extends State<HomeFeeds> {
  PostBloc _postBloc;

  @override
  void initState() {
    _postBloc = context.read<PostBloc>()..add(FetchPostFeedsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
        // ignore: missing_return
        builder: (context, state) {
      if (state is PostLoadingState ||
          state is PostUnInitializedState) {
        return ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  height: 5,
                  thickness: 5,
                ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return PostShimmer();
            });
      }
      if (state is PostFetchSuccessState) {
        var feeds = state.feeds;
        if (state.feeds.length == 0 )
          return Center(child: Text("No Feeds for now. Try to follow friends or join spaces"),);
        return ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  height: 5,
                  thickness: 5,
                ),
            itemCount: feeds.length,
            itemBuilder: (context, index) {
              return PostContainer(
                post: feeds[index],
              );
            });
      }
    });
  }
}
