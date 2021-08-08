import 'package:app/application/question/question_state.dart';
import 'package:app/domain/post/posts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionCubit extends Cubit<QuestionState> {

  final PostService _postService;
  QuestionCubit(this._postService) : super(QuestionUnInitializedState());


  Future<void> fetchQuestions()async {
    var response = await _postService.fetchQuestions();
    if (response.isError) {
      emit(QuestionFetchErrorState(response.errors.message));
    }

    emit(QuestionFetchedState(response.data));
  }

}