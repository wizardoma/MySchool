import 'package:app/application/post/create_post_request.dart';
import 'package:app/commons/api.dart';
import 'package:dio/dio.dart';

import 'post.dart';
import 'package:app/domain/response.dart';

class PostClient {
  Future<ResponseEntity> fetchFeeds() async {
    Response response;
    try {
      response = await dioClient.get(
        "/posts",
      );

      List<Post> posts = [];

      response.data["data"].forEach((post) {
        posts.add(Post.fromServer(post));
      });

      return ResponseEntity.Data(posts);
    } on DioError catch (e) {
      print("DioError: ${e.error} and ${e.response.data}");
      return ResponseEntity.Error(
          e.response.data["errors"] ?? "An error occurred fetching posts");
    } catch (e) {
      print("Exception from posts $e");
      return ResponseEntity.Error("An error occurred fetching posts");
    }
  }

  Future<ResponseEntity> fetchQuestionsPost() async {
    return await Future.delayed(
        Duration(seconds: 1),
        () => ResponseEntity.Data(
            List.generate(20, (index) => Post.RandomQuestions())));
  }

  Future<ResponseEntity> create(FormData data) async {
    Response response;
    try {
      response = await dioClient.post("/posts", data: data);

      return ResponseEntity.Data(Post.fromServer(response.data["data"]));
    } on DioError catch (e) {
      print("DioError: ${e.error} and ${e.response.data}");
      return ResponseEntity.Error(
          e.response.data["errors"] ?? "An error occurred creating a post");
    } catch (e) {
      print("Exception $e");
      return ResponseEntity.Error(
          "An error occurred creating a post, please try again later");
    }
  }
}
