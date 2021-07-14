import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/homefeeds/home_feeds_bloc.dart';
import 'package:app/domain/auth/authentication_client.dart';
import 'package:app/domain/auth/authentication_service.dart';
import 'package:app/domain/auth/authentication_service_impl.dart';
import 'package:app/domain/auth/firebase_auth_service.dart';
import 'package:app/domain/feeds/homefeeds_client.dart';
import 'package:app/domain/feeds/homefeeds_service.dart';
import 'package:app/domain/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IoC {

  Map<String, Service> _services;
  Map<String, Bloc> _blocs;



  AuthenticationClient _authenticationClient;
  AuthenticationService _authenticationService;
  AuthenticationBloc _authenticationBloc;
  HomeFeedsBloc _homeFeedsBloc;
  HomeFeedsService _homeFeedsService;
  HomeFeedsClient _homeFeedsClient;

  IoC(){
    _authenticationClient = FirebaseAuthService();
    _authenticationService = AuthenticationServiceImpl(_authenticationClient);
    _authenticationBloc = AuthenticationBloc(authenticationService: _authenticationService);
    _homeFeedsClient = HomeFeedsClient();
    _homeFeedsService = HomeFeedsService(_homeFeedsClient);
    _homeFeedsBloc = HomeFeedsBloc(_homeFeedsService);

    _services =  {
      "auth": _authenticationService,
      "home_feeds": _homeFeedsService,
    };

    _blocs = {
      "auth": _authenticationBloc,
      "home_feeds": _homeFeedsBloc,
    };

  }

  Bloc getBloc(String blocName){
    Bloc bloc = _blocs["$blocName"];
    if (bloc == null) {
      throw Exception("Bloc specified was not found");
    }

    return bloc;
  }
}