import 'package:app/application/post/create_post_request.dart';
import 'package:app/application/post/post_state.dart';
import 'package:app/domain/post/posts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCrudCubit extends Cubit<PostState> {
  PostService _postService;

  PostCrudCubit(this._postService) : super(PostUnInitializedState());

  Future<void> createPost(CreatePostRequest request) async {
    emit(PostLoadingState());
    var response = await _postService.createPost(request);

    if (response.isError) {
      emit(PostCreateFailureState(response.errors.message));
    }
    else {
    emit(PostCreateSuccess(response.data)); }
  }
}
