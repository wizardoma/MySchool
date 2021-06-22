import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/domain/auth/authentication_client.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';

abstract class AuthenticationService extends Service {
  final AuthenticationClient authenticationClient;

  AuthenticationService(this.authenticationClient);
  Future<ResponseEntity> signUp(SignUpRequest signUpRequest);

  Future<ResponseEntity> login(
    LoginRequest request,
  );

  Future<ResponseEntity> loginWithGoogle();

  void logout();

  Future<ResponseEntity> checkAuthentication();
}
