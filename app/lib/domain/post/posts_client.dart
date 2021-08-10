import 'package:app/application/post/create_post_request.dart';
import 'package:app/commons/api.dart';
import 'package:app/domain/question/comment.dart';
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
    Response response;
    try {
      response = await dioClient.get(
        "/posts/questions",
      );
      List<Post> posts = [];
      response.data["data"].forEach((post) {
        posts.add(Post.fromServer(post));
      });

      return ResponseEntity.Data(posts);
    } on DioError catch (e) {
      print("DioError: ${e.error} ");
      return ResponseEntity.Error(
          e.response.data["errors"] ?? "An error occurred fetching posts");
    } catch (e) {
      print("Exception from questions $e");
      return ResponseEntity.Error("An error occurred fetching questions");
    }
  }

  Future<ResponseEntity> create(FormData data) async {
    Response response;
    try {
      response = await dioClient.post("/posts", data: data);

      return ResponseEntity.Data(Post.fromServer(response.data["data"]));
    } on DioError catch (e) {
      print("DioError: ${e.error} and ${e.response}");
      return ResponseEntity.Error(
          e.response.data["errors"] ?? "An error occurred creating a post");
    } catch (e) {
      print("Exception $e");
      return ResponseEntity.Error(
          "An error occurred creating a post, please try again later");
    }
  }

  Future<ResponseEntity> createComment(int postId, FormData formData) async {
    Response response;
    try {
      response = await dioClient.post("/posts/$postId/comments", data: formData);

      return ResponseEntity.Data(Comment.fromServer(response.data["data"]));
    } on DioError catch (e) {
      print("DioError: ${e.error} and ${e.response}");
      return ResponseEntity.Error(
          e.response.data["errors"] ?? "An error occurred creating a comment");
    } catch (e) {
      print("Exception $e");
      return ResponseEntity.Error(
          "An error occurred creating a comment, please try again later");
    }

  }

  Future<ResponseEntity> fetchPost(int postId) async {
    Response response;
    try {
      response = await dioClient.get("/posts/$postId");

      return ResponseEntity.Data(Post.fromServer(response.data["data"]));
    } on DioError catch (e) {
      print("DioError: ${e.error} and ${e.response}");
      return ResponseEntity.Error(
          e.response.data["errors"] ?? "An error occurred fetching a post");
    } catch (e) {
      print("Exception $e");
      return ResponseEntity.Error(
          "An error occurred fetching a post, please try again later");
    }


  }
}
