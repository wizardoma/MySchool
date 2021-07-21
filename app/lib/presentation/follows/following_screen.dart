import 'package:app/application/following/following_posts_bloc.dart';
import 'package:app/application/following/following_posts_event.dart';
import 'package:app/application/following/following_posts_state.dart';
import 'package:app/presentation/widgets/post_container.dart';
import 'package:app/presentation/widgets/post_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingScreen extends StatefulWidget {
  static const title = "Followings";

  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  FollowingPostBloc _followingPostBloc;
  @override
  void initState() {
    _followingPostBloc = context.read<FollowingPostBloc>()..add(FetchFollowingPostEvent());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingPostBloc, FollowingPostState>(
      // ignore: missing_return
        builder: (context, state) {
          if (state is FetchingFollowingPostState ||
              state is FollowingPostStateUnInitialized) {
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
          if (state is FetchFollowingPostStateSuccess) {
            var feeds = state.posts;
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(height: 5, thickness: 5,),
                itemCount: feeds.length,
                itemBuilder: (context, index) {
                  return PostContainer( post: feeds[index],

                  );
                }
            );

          }
        });
  }
}
