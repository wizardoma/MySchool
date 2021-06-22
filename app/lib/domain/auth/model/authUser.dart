import 'package:app/application/auth/signup_request.dart';
import 'package:app/domain/auth/model/signUpUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthUser {
  final String email;
  final bool isEmailVerified;
  final String id;

  const AuthUser({@required this.email, this.isEmailVerified, @required this.id});

  factory AuthUser.fromFirebaseUser(User user){
    if (user==null) return null;
    return AuthUser(id: user.uid, email: user.email, isEmailVerified: user.emailVerified);
  }

  factory AuthUser.fromSignUp(SignUpUser user) {
    return AuthUser(email: user.email, id: user.id);
  }

  @override
  String toString() {
    return 'AuthUser{email: $email, isEmailVerified: $isEmailVerified, id: $id}';
  }
}