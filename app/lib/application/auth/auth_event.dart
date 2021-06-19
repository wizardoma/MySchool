import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final LoginRequest loginRequest;

  LoginEvent(this.loginRequest);
}

class LogoutEvent extends AuthenticationEvent {}

class InitializeAuthEvent extends AuthenticationEvent {}

class GoogleSignInEvent extends AuthenticationEvent {
  GoogleSignInEvent();
}

class SignUpEvent extends AuthenticationEvent {
  final SignUpRequest signUpRequest;

  SignUpEvent(this.signUpRequest);
}
