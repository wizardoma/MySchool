import 'dart:async';

import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/application/user/user_event.dart';
import 'package:app/application/user/user_state.dart';
import 'package:app/domain/auth/model/authUser.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/domain/user/user_service.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  final UserService userService;
  final AuthenticationBloc authenticationBloc;
  StreamSubscription _streamSubscription;

  UserBloc(this.userService, this.authenticationBloc)
      : super(UserNotInitializedState()) {
    _streamSubscription = authenticationBloc.stream.listen((state) {
      if (state is AuthenticatedState) {
        add(FetchUserEvent());
      }
    });
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUserEvent) {
      yield FetchingUserState();
      var authenticationState = authenticationBloc.state;

      if (authenticationState is AuthenticatedState) {
        yield await fetchUser(authenticationState.authUser);
      } else {
        yield FetchUserErrorState("You are not authenticated");
      }
    }
  }

  Future<UserState> fetchUser(AuthUser authUser) async {
    var response = await userService.getUserById(authUser.id);
    if (response.isError) {
      return FetchUserErrorState(response.errors.message);
    }

    return FetchedUserState(response.data);
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  @override
  UserState fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return FetchUserErrorState("No user found");
    }
    return FetchedUserState(User.fromMap(json));
  }

  @override
  Map<String, dynamic> toJson(UserState state) {
    if (state is FetchedUserState) {
      return state.user == null ? null : state.user.toMap();
    } else {
      return null;
    }
  }
}
