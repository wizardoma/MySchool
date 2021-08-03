import 'package:app/domain/auth/model/signUpUser.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';
import 'package:app/domain/user/user.dart';

abstract class UserService extends Service{

  Future<ResponseEntity> getUserById(String id);

}