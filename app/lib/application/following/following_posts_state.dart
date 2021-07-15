import 'package:app/domain/posts/post.dart';

abstract class FollowingPostState {}

class FollowingPostStateUnInitialized extends FollowingPostState{}
class FetchingFollowingPostState extends FollowingPostState{}
class FetchFollowingPostStateSuccess extends FollowingPostState {
  final List<Post> posts;

  FetchFollowingPostStateSuccess(this.posts);
}
class FetchFollowingPostStateFailure extends FollowingPostState {
  final String error;

  FetchFollowingPostStateFailure(this.error);
}