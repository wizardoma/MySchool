import 'package:app/domain/auth/model/authUser.dart';
import 'package:app/domain/auth/model/signUpUser.dart';

abstract class AuthenticationState {}

class AuthenticatingState extends AuthenticationState {}

class NotAuthenticatedState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final AuthUser authUser;

  AuthenticatedState(this.authUser);
}

class LoggedInSuccessState extends AuthenticatedState {
  LoggedInSuccessState(AuthUser authUser) : super(authUser);
}

class SignUpSuccessState extends AuthenticatedState {
  final SignUpUser user;
  SignUpSuccessState(this.user) : super(AuthUser.fromSignUp(user));
}

class AuthenticationErrorState extends AuthenticationState {
  final dynamic errors;

  AuthenticationErrorState(this.errors);
}

class AuthenticationUnInitializedState extends AuthenticationState {}
