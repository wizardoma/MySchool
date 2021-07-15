import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/following/following_posts_bloc.dart';
import 'package:app/application/homefeeds/home_feeds_bloc.dart';
import 'package:app/domain/auth/authentication_client.dart';
import 'package:app/domain/auth/authentication_service.dart';
import 'package:app/domain/auth/authentication_service_impl.dart';
import 'package:app/domain/auth/firebase_auth_service.dart';
import 'package:app/domain/feeds/posts_client.dart';
import 'package:app/domain/feeds/posts_service.dart';
import 'package:app/domain/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IoC {
  Map<String, Service> _services;
  Map<String, Bloc> _blocs;

  AuthenticationClient _authenticationClient;
  AuthenticationService _authenticationService;
  AuthenticationBloc _authenticationBloc;
  HomeFeedsBloc _homeFeedsBloc;
  FollowingPostBloc _followingPostBloc;
  PostService _postService;
  PostClient _postClient;

  IoC() {
    _authenticationClient = FirebaseAuthService();
    _authenticationService = AuthenticationServiceImpl(_authenticationClient);
    _authenticationBloc =
        AuthenticationBloc(authenticationService: _authenticationService);
    _postClient = PostClient();
    _postService = PostService(_postClient);
    _homeFeedsBloc = HomeFeedsBloc(_postService);
    _followingPostBloc = FollowingPostBloc(_postService);
    _services = {
      "auth": _authenticationService,
      "post": _postService,
    };

    _blocs = {
      "auth": _authenticationBloc,
      "home_feeds": _homeFeedsBloc,
      "following": _followingPostBloc,
    };
  }

  Bloc getBloc(String blocName) {
    Bloc bloc = _blocs["$blocName"];
    if (bloc == null) {
      throw Exception("Bloc specified was not found");
    }

    return bloc;
  }
}
