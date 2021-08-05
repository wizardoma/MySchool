import 'package:flutter/foundation.dart';

/// Author: Ibekason Alexander

class SignUpUser {
  final String id;
  final String name;
  final String email;
  final String matricNo;
  final int department;
  final String level;
  final int university;

  const SignUpUser(
      {this.matricNo,
      @required this.id,
      this.name,
      @required this.email,
      this.department,
      this.level,
      this.university});

  factory SignUpUser.fromMap(Map<String, dynamic> map) {
    return new SignUpUser(
      id: map['id'] as String,
      name: map['name'] as String,
      matricNo: map['matricNo'] as String,
      email: map['email'] as String,
      department: map['department'] as int,
      level: map['level'] as String,
      university: map['university'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'matricNo': this.matricNo,
      'name': this.name,
      'email': this.email,
      'department': this.department,
      'level': this.level,
      'university': this.university,
    } as Map<String, dynamic>;
  }
}
