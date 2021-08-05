import 'package:app/domain/auth/model/signUpUser.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/domain/user/user_service.dart';
import 'package:dio/dio.dart';

/// Author: Ibekason Alexander

class UserServiceImpl extends UserService {
  @override
  Future<ResponseEntity> getUserById(String id) async {
    Response response;
    try {
      print(" user id $id");
      response =
          await Dio(BaseOptions(connectTimeout: 15000, receiveTimeout: 15000))
              .get(
        "https://myschool-project.herokuapp.com/students/$id",
      );

      var user = User.fromServer(response.data["data"]);
      print("user from server $user");
      return ResponseEntity.Data(user);
    } on DioError catch (e) {
      print("DioError: ${e.error} and ${e.response}");
      return ResponseEntity.Error("An error occurred fetching user");
    } catch (e) {
      print("Exception $e");
      return ResponseEntity.Error("An error occurred fetching user");
    }
  }
}
