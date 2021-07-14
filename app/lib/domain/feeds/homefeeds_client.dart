import 'package:app/domain/posts/post.dart';
import 'package:app/domain/response.dart';

class HomeFeedsClient {

  List<Post> _dummyFeeds =List.generate(20, (index) => Post.Random());

  Future<ResponseEntity> fetchFeeds() async{
   return await Future.delayed(Duration(seconds: 5), () => ResponseEntity.Data(_dummyFeeds));

  }


}