import 'package:app/domain/response.dart';
import 'package:app/domain/space/spaces_list.dart';

class SpaceClient {

//  List<Post> _dummyFeeds =List.generate(20, (index) => Post.Random());

  Future<ResponseEntity> fetchSpaces() async {
    return await Future.delayed(
      Duration(seconds: 1),
          () => ResponseEntity.Data(
        List.generate(spacesList.length, (index) => spacesList[index]),
      ),
    );
  }

}