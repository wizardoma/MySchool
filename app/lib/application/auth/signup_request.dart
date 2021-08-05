import 'package:flutter/foundation.dart';

/// Author: Ibekason Alexander

class SignUpRequest {
  final String name;
  final String password;
  final String email;
  final String departmentId;
  final String level;
  final String universityId;

  final String matricNo;

  SignUpRequest(
      {this.name,
      @required this.password,
      @required this.email,
      @required this.matricNo,
      @required this.departmentId,
      @required this.level,
      @required this.universityId});

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return new SignUpRequest(
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      departmentId: map['department'] as String,
      level: map['level'] as String,
      universityId: map['university'] as String,
      matricNo: map['matricNo'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'password': this.password,
      'email': this.email,
      'department': this.departmentId,
      'level': this.level,
      'university': this.universityId,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'SignUpRequest{name: $name, password: $password, email: $email, department: $departmentId, level: $level, university: $universityId, matricNo: $matricNo}';
  }
}
