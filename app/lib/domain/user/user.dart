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
  final String description;
  final String university;
  final String email;
  final String level;

  User({
    this.id,
    this.name,
    this.department,
    this.description,
    this.university,
    this.email,
    this.level,
  });


  factory User.fromServer(Map<String, dynamic> map) {
    print("user from map ${map.toString()}");
    return new User(
      id: map['id'] as String,
      name:
          "${map['fullName']}",
      department: map['department'] as String,

      description: map['description'] as String,
      university: map['university']["fullName"] as String,
      email: map['email'] as String,
      level: map['level'] as String,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      id: map['id'] as String,
      name: map['name'] as String,
      department: map['department'] as String,
      description: map['description'] as String,
      university: map['university'] as String,
      email: map['email'] as String,
      level: map['level'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'department': this.department,
      'description': this.description,
      'university': this.university,
      'email': this.email,
      'level': this.level,
    } as Map<String, dynamic>;
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
