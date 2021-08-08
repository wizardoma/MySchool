import 'package:app/domain/post/post.dart';

abstract class QuestionState {}

class QuestionUnInitializedState extends QuestionState {}

class QuestionLoadingState extends QuestionState {}

class QuestionFetchedState extends QuestionState {
  final List<Post> posts;

  QuestionFetchedState(this.posts);
}

class QuestionFetchErrorState extends QuestionState {
  final String errorMessage;

  QuestionFetchErrorState(this.errorMessage);
}