import 'package:app/application/post/create_post_request.dart';
import 'package:app/domain/post/posts_client.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';
import 'package:dio/dio.dart';

class PostService extends Service {
  final PostClient _postClient;

  PostService(this._postClient);

  Future<ResponseEntity> createPost(CreatePostRequest request) async {
    var response = await _postClient.create(FormData.fromMap(request.toMap()));
    return response;
  }

  Future<ResponseEntity> fetchFeeds() async {
    return await _postClient.fetchFeeds();
  }
}
