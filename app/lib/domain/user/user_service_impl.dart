import 'package:app/domain/response.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/domain/user/user_client.dart';
import 'package:app/domain/user/user_service.dart';

/// Author: Ibekason Alexander

class UserServiceImpl extends UserService {
  final UserClient userClient;

  UserServiceImpl(this.userClient);



  @override
  Future<ResponseEntity> editName(String name) {

  }

  @override
  Future<ResponseEntity> getUserById(String id) {

  }

}