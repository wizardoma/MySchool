import 'package:app/domain/response.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/domain/user/user_client.dart';
import 'package:app/domain/user/user_service.dart';

/// Author: Ibekason Alexander

class UserServiceImpl extends UserService {


  @override
  Future<ResponseEntity> getUserById(String id) {
    return Future.delayed(Duration(seconds: 1), () {
      return ResponseEntity.Data(User.Random());
    });
  }

  @override
  Future<ResponseEntity> storeUser(User user) {

  }


//  void _saveUser
}
