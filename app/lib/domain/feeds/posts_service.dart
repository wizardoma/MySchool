import 'package:app/domain/feeds/posts_client.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';

class PostService extends Service{
  final PostClient _postClient;
  PostService(this._postClient);

  Future<ResponseEntity> fetchFeeds() async {
    return await _postClient.fetchFeeds();
  }

  Future<ResponseEntity> fetchFollowingPosts() async {
    return await _postClient.fetchFollowingPosts();
  }
}