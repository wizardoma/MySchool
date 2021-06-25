import 'package:app/domain/auth/model/signUpUser.dart';

class User {
  final String id;
  final String name;
  final String department;
  final String university;
  final String email;
  final String level;

  User({
    this.id,
    this.name,
    this.department,
    this.university,
    this.email,
    this.level,
  });

  factory User.fromSignUpUser(SignUpUser user) {
    return User(
      id: user.id,
      email: user.email,
      department: user.department,
      name: user.name,
      university: user.university,
      level: user.level,
    );
  }
}
