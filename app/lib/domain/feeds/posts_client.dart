import 'package:app/domain/posts/post.dart';
import 'package:app/domain/response.dart';

class PostClient {

  List<Post> _dummyFeeds =List.generate(20, (index) => Post.Random());

  Future<ResponseEntity> fetchFeeds() async{
   return await Future.delayed(Duration(seconds: 1), () => ResponseEntity.Data(List.generate(20, (index) => Post.Random())));

  }

  Future<ResponseEntity> fetchFollowingPosts() async{
    return await Future.delayed(Duration(seconds: 1), () => ResponseEntity.Data(List.generate(20, (index) => Post.RandomFollowings())));

  }



}