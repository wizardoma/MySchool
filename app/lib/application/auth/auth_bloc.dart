import 'package:app/application/auth/auth_event.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/domain/auth/authentication_service.dart';
import 'package:app/domain/response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Author: Ibekason Alexander

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService authenticationService;

  AuthenticationBloc({this.authenticationService})
      : super(AuthenticationUnInitializedState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationUnInitializedState) {
      yield await checkAuth();
    }
    if (event is LoginEvent) {
      yield AuthenticatingState();
      yield await login(event.loginRequest);
    }

    if (event is GoogleSignInEvent) {
      yield AuthenticatingState();
      yield await googleSignIn();
    }

    if (event is SignUpEvent) {
      yield AuthenticatingState();
      yield await signUp(event.signUpRequest);
    }

    if (event is LogoutEvent) {
      yield await Future.delayed(Duration(seconds: 2));
      yield await logout();
    }
  }

  Future<AuthenticationState> checkAuth() async {
    var response = await authenticationService.checkAuthentication();
    return response.isError
        ? NotAuthenticatedState()
        : AuthenticatedState(response.data);
  }

  Future<AuthenticationState> logout() async {
    authenticationService.logout();
    return NotAuthenticatedState();
  }

  Future<AuthenticationState> signUp(SignUpRequest signUpRequest) async {
    var responseEntity = await authenticationService.signUp(signUpRequest);
    if (responseEntity.isError) {
      return AuthenticationErrorState(responseEntity.errors.message);
    }
    return AuthenticatedState(responseEntity.data);
  }

  Future<AuthenticationState> login(LoginRequest loginRequest) async {
    var responseEntity = await authenticationService.login(loginRequest);
    if (responseEntity.isError) {
      return AuthenticationErrorState(responseEntity.errors.message);
    }
    return AuthenticatedState(responseEntity.data);
  }

  Future<AuthenticationState> googleSignIn() async {
    ResponseEntity responseEntity =
        await authenticationService.loginWithGoogle();
    if (responseEntity.isError) {
      return AuthenticationErrorState(responseEntity.errors.message);
    }
    return AuthenticatedState(responseEntity.data);
  }
}
