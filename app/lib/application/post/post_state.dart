import '../../domain/post/post.dart';

abstract class PostState {}

class PostUnInitializedState extends PostState {}

class PostFetchSuccessState extends PostState {
  final List<Post> feeds;

  PostFetchSuccessState(this.feeds);
}

class PostCreateSuccess extends PostState {
  final Post post;

  PostCreateSuccess(this.post);
}

class PostCreateFailureState extends PostState {
  final String errorMessage;

  PostCreateFailureState(this.errorMessage);
}


class PostLoadingState extends PostState {}
