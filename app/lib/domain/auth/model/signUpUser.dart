import 'package:flutter/foundation.dart';

/// Author: Ibekason Alexander

class SignUpUser {
  final String id;
  final String name;
  final String email;
  final String department;
  final String level;
  final String university;

  const SignUpUser(
      {@required this.id,
      this.name,
      @required this.email,
      this.department,
      this.level,
      this.university});

  factory SignUpUser.fromMap(Map<String, dynamic> map) {
    return new SignUpUser(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      department: map['department'] as String,
      level: map['level'] as String,
      university: map['university'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'department': this.department,
      'level': this.level,
      'university': this.university,
    } as Map<String, dynamic>;
  }
}
