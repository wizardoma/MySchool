import 'package:flutter/foundation.dart';

/// Author: Ibekason Alexander

class SignUpUser {
  final String id;
  final String name;
  final String email;
  final String matricNo;
  final int departmentId;
  final String level;
  final int universityId;

  const SignUpUser(
      {this.matricNo,
      @required this.id,
      this.name,
      @required this.email,
      this.departmentId,
      this.level,
      this.universityId});

  factory SignUpUser.fromMap(Map<String, dynamic> map) {
    return new SignUpUser(
      id: map['id'] as String,
      name: map['name'] as String,
      matricNo: map['matricNo'] as String,
      email: map['email'] as String,
      departmentId: map['department'] as int,
      level: map['level'] as String,
      universityId: map['university'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'matricNo': this.matricNo,
      'name': this.name,
      'email': this.email,
      'departmentId': this.departmentId,
      'level': this.level,
      'universityId': this.universityId,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'SignUpUser{id: $id, name: $name, email: $email, matricNo: $matricNo, department: $departmentId, level: $level, university: $universityId}';
  }
}
