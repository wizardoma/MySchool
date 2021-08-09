import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/event/event_bloc.dart';
import 'package:app/application/following/following_posts_bloc.dart';
import 'package:app/application/post/post_crud_cubit.dart';
import 'package:app/application/post/posts_bloc.dart';
import 'package:app/application/notification/notification_bloc.dart';
import 'package:app/application/question/question_bloc.dart';
import 'package:app/application/space/spaces_bloc.dart';
import 'package:app/application/trends/trends_bloc.dart';
import 'package:app/application/user/user_bloc.dart';
import 'package:app/domain/auth/authentication_client.dart';
import 'package:app/domain/auth/authentication_service.dart';
import 'package:app/domain/auth/authentication_service_impl.dart';
import 'package:app/domain/auth/firebase_auth_service.dart';
import 'package:app/domain/event/event_client.dart';
import 'package:app/domain/event/event_service.dart';
import 'package:app/domain/post/posts_client.dart';
import 'package:app/domain/post/posts_service.dart';
import 'package:app/domain/notification/notification_client.dart';
import 'package:app/domain/notification/notification_service.dart';
import 'package:app/domain/service.dart';
import 'package:app/domain/space/space_client.dart';
import 'package:app/domain/space/space_service.dart';
import 'package:app/domain/trends/trends_service.dart';
import 'package:app/domain/user/user_service.dart';
import 'package:app/domain/user/user_service_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Ibekason Alexander Onyebuchi
// Inversion of Control Container for dependency managements

class IoC {
  Map<String, Service> _services;
  Map<String, Bloc> _blocs;
  Map<String, Cubit> _cubits;

  AuthenticationClient _authenticationClient;
  NotificationClient _notificationClient;
  NotificationService _notificationService;
  NotificationBloc _notificationBloc;
  SpaceClient _spaceClient;
  TrendService _trendService;
  TrendsBloc _trendsBloc;
  SpaceService _spaceService;
  EventClient _eventClient;
  SpaceBloc _spaceBloc;
  UserBloc _userBloc;
  QuestionCubit _questionCubit;
  EventService _eventService;
  UserService _userService;
  AuthenticationService _authenticationService;
  AuthenticationBloc _authenticationBloc;
  EventBloc _eventBloc;
  PostBloc _postBloc;
  FollowingPostBloc _followingPostBloc;
  PostService _postService;
  PostCrudCubit _postCrudCubit;
  PostClient _postClient;

  IoC() {
    _authenticationClient = FirebaseAuthService();
    _userService = UserServiceImpl();
    _notificationClient = NotificationClient();
    _trendService = TrendService();
    _trendsBloc = TrendsBloc(_trendService);
    _eventClient = EventClient();
    _spaceClient = SpaceClient();
    _eventService = EventService(_eventClient);
    _spaceService = SpaceService(_spaceClient);
    _notificationService = NotificationService(_notificationClient);
    _authenticationService = AuthenticationServiceImpl(_authenticationClient);
    _authenticationBloc =
        AuthenticationBloc(authenticationService: _authenticationService);
    _userBloc = UserBloc(_userService, _authenticationBloc);
    _spaceBloc = SpaceBloc(_spaceService, _userBloc);

    _eventBloc = EventBloc(_eventService);
    _postClient = PostClient();
    _postService = PostService(_postClient);
    _notificationBloc = NotificationBloc(_notificationService);
    _postBloc = PostBloc(_postService);
    _questionCubit = QuestionCubit(_postService);
    _postCrudCubit = PostCrudCubit(_postService);

    _followingPostBloc = FollowingPostBloc(_postService);
    _services = {
      "auth": _authenticationService,
      "post": _postService,
    };

    _cubits = {
      "post_crud": _postCrudCubit,
      "question": _questionCubit,
    };

    _blocs = {
      "trend": _trendsBloc,
      "auth": _authenticationBloc,
      "post": _postBloc,
      "following": _followingPostBloc,
      "user": _userBloc,
      "space": _spaceBloc,
      "event": _eventBloc,
      "notification": _notificationBloc,
    };
  }

  Bloc getBloc(String blocName) {
    Bloc bloc = _blocs["$blocName"];
    if (bloc == null) {
      throw Exception("Bloc specified was not found");
    }

    return bloc;
  }

  Cubit getCubit(String cubitName) {
    Cubit cubit = _cubits["$cubitName"];
    if (cubit == null) {
      throw Exception("Cubit specified was not found");
    }

    return cubit;
  }
}
