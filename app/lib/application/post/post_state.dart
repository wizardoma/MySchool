import '../../domain/post/post.dart';

abstract class PostState {}

class PostUnInitializedState extends PostState {}

class PostFetchSuccessState extends PostState {
  final List<Post> feeds;

  PostFetchSuccessState(this.feeds);
}

class FetchingPostsState extends PostState {}
