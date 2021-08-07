import 'package:app/application/post/posts_event.dart';
import 'package:app/application/post/post_state.dart';
import 'package:app/domain/post/posts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService postService;

  PostBloc(this.postService) : super(PostUnInitializedState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPostFeedsEvent) {
      yield FetchingPostsState();
      yield await fetchHomeFeeds();
    }
  }

  Future<PostState> fetchHomeFeeds() async {
    var response = await postService.fetchFeeds();

    if (!response.isError) {
      return PostFetchSuccessState(response.data);
    }
  }
}
