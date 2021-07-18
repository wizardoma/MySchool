import 'dart:math';

import 'package:app/domain/auth/model/signUpUser.dart';
import 'package:app/domain/user/usersList.dart';

final userLevels = [
  "Jupeg",
  "Predegree",
  "Post graduate",
  ...List.generate(7, (index) => "${index + 1}00L")
];

final userSchools = <String, String>{
  "futo": "Federal University of Technology, Owerri",
  "imsu": "Imo State University",
  "palm": "Eastern Palm University",
};

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

  factory User.Random() {
    return User(
        id: DateTime.now()
            .add(Duration(seconds: Random().nextInt(100000)))
            .toString(),
        name: usersList[Random().nextInt(usersList.length)],
        email: "alibekason@gmail.com",
        department: "Computer Science",
        university: userSchools[
            userSchools.keys.toList()[Random().nextInt(userSchools.length)]],
        level: userLevels[Random().nextInt(userLevels.length)]);
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, department: $department, university: $university, email: $email, level: $level}';
  }
}
