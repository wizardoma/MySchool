import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/domain/response.dart';

/// Author: Ibekason Alexander

abstract class AuthenticationClient {
  Future<ResponseEntity> signUp(SignUpRequest signUpRequest);

  Future<ResponseEntity> login(LoginRequest request);

  Future<ResponseEntity> loginWithGoogle();

  // delete newly created user
  Future<void> delete();

  void logout();

  Future<ResponseEntity> checkAuthentication();
}
