import 'package:app/application/post/create_post_request.dart';
import 'package:app/application/post/post_state.dart';

abstract class PostEvent {}

class FetchPostFeedsEvent extends PostEvent {}


class CreatePostEvent extends PostEvent {
  final CreatePostRequest request;

  CreatePostEvent(this.request);
}