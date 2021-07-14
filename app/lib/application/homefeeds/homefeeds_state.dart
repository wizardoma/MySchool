import 'package:app/domain/posts/post.dart';

abstract class HomeFeedsState {}

class HomeFeedsUnInitializedState extends HomeFeedsState {}

class FetchHomeFeedsSuccessState extends HomeFeedsState {
  final List<Post> feeds;

  FetchHomeFeedsSuccessState(this.feeds);
}

class FetchingHomeFeedsState extends HomeFeedsState {}
