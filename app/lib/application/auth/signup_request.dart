import 'package:flutter/foundation.dart';

class SignUpRequest {
  final String name;
  final String password;
  final String email;
  final String department;
  final String level;
  final String school;

  const SignUpRequest({this.name, @required this.password, @required this.email, this.department, this.level, this.school});




}