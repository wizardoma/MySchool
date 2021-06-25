import 'package:app/domain/service.dart';
import 'package:app/domain/user/user.dart';

abstract class UserService extends Service{

  User editName(String name);
  User getUserById(String id);

}