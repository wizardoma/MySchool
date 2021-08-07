import 'package:app/application/following/following_posts_event.dart';
import 'package:app/application/following/following_posts_state.dart';
import 'package:app/domain/post/posts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingPostBloc extends Bloc<FollowingPostEvent, FollowingPostState> {
  final PostService _postService;

  FollowingPostBloc(this._postService)
      : super(FollowingPostStateUnInitialized());

  @override
  Stream<FollowingPostState> mapEventToState(FollowingPostEvent event) async* {
    if (event is FetchFollowingPostEvent) {
      yield FetchingFollowingPostState();
//      yield await fetchFollowingPosts();
    }
  }

}
