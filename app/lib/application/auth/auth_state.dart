import 'package:app/domain/auth/model/user.dart';

abstract class AuthenticationState {}

class AuthenticatingState extends AuthenticationState{}
class NotAuthenticatedState extends AuthenticationState {}
class AuthenticatedState extends AuthenticationState {
  final AuthUser authUser;

  AuthenticatedState(this.authUser);

}
class AuthenticationErrorState extends AuthenticationState {
  final dynamic errors;

  AuthenticationErrorState(this.errors);
}

class AuthenticationUnInitializedState extends AuthenticationState {}