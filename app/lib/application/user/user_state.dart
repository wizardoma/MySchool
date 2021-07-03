import 'package:app/domain/user/user.dart';

abstract class UserState {}

class FetchingUserState extends UserState{}

class UserNotInitializedState extends UserState {}
class FetchedUserState extends UserState {
  final User user;

  FetchedUserState(this.user);
}

class FetchUserErrorState extends UserState {
  final String errorMessage;

  FetchUserErrorState(this.errorMessage);
}