import 'package:app/domain/question/comment.dart';

import '../../domain/post/post.dart';

abstract class PostState {}

class PostUnInitializedState extends PostState {}

class PostFetchErrorState extends PostState {
  final String errorMessage;

  PostFetchErrorState(this.errorMessage);
}

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

class PostCommentAddedSuccessState extends PostState {
  final Comment comment;

  PostCommentAddedSuccessState(this.comment);
}

class PostCommentAddedFailureState extends PostState {
  final String errorMessage;

  PostCommentAddedFailureState(this.errorMessage);
}

class PostSingleFetchErrorState extends PostState {
  final String errorMessage;

  PostSingleFetchErrorState(this.errorMessage);
}

class PostSingleFetchedState extends PostState {
  final Post post;

  PostSingleFetchedState(this.post);
}
