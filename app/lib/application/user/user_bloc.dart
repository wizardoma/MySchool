import 'dart:async';

import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/application/user/user_event.dart';
import 'package:app/application/user/user_state.dart';
import 'package:app/domain/user/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  final AuthenticationBloc authenticationBloc;
  StreamSubscription _streamSubscription;

  UserBloc(this.userService, this.authenticationBloc)
      : super(UserNotInitializedState()) {
    print("user bloc");
    _streamSubscription = authenticationBloc.stream.listen((state) {
      print("listening");
      if (state is AuthenticatedState) {
        add(FetchUserEvent());
      }
    });
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUserEvent) {
      print("event is fetchuser");

      yield FetchingUserState();
      var authenticationState = authenticationBloc.state;
      if (authenticationState is AuthenticatedState) {
        yield await fetchUser(authenticationState.authUser.id);
      } else {
        yield FetchUserErrorState("You are not authenticated");
      }
    }
  }

  Future<UserState> fetchUser(String id) async {
    var response = await userService.getUserById(id);
    if (response.isError) {
      return FetchUserErrorState(response.errors.message);
    } else
      return FetchedUserState(response.data);
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
