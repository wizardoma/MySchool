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

}