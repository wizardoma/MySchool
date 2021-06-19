import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/domain/auth/model/user.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationService extends Service{
  Future<ResponseEntity> signUp(SignUpRequest signUpRequest);

  Future<ResponseEntity> login(LoginRequest request);

  Future<ResponseEntity> googleSignIn();

  void logout();

  Future<AuthUser> checkAuthentication();
}
