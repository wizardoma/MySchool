import 'package:app/application/post/posts_bloc.dart';
import 'package:app/application/post/posts_event.dart';
import 'package:app/application/post/post_state.dart';
import 'package:app/commons/styles.dart';
import 'package:app/presentation/widgets/post_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookMarkScreen extends StatefulWidget {

  static const routeName = "/bookmarks";
  @override
  _BookMarkScreenState createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  PostBloc _feedsBloc;

  @override
  void initState() {
    _feedsBloc = context.read<PostBloc>()..add(FetchPostFeedsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        leading: BackButton(
          color: Colors.black87,
        ),
        title: Text(
          "Bookmarks",
          style: kPostTitleTextStyle,
        ),
      ),
      body: BlocBuilder<PostBloc, PostState>(
          // ignore: missing_return
          builder: (context, state) {
        if (state is PostLoadingState ||
            state is PostUnInitializedState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is PostFetchSuccessState) {
          var feeds = state.feeds;
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
      }),
    );
  }
}
