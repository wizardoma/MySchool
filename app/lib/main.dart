import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/application/following/following_posts_bloc.dart';
import 'package:app/application/homefeeds/home_feeds_bloc.dart';
import 'package:app/application/notification/notification_bloc.dart';
import 'package:app/application/theme/theme_cubit.dart';
import 'package:app/commons/routes.dart';
import 'package:app/domain/auth/firebase_initializer.dart';
import 'package:app/ioc.dart';
import 'package:app/presentation/auth/auth_screen.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

/// Author: Ibekason Alexander

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  var ioC = IoC();
  runApp(MyApp(ioC: ioC));
}

class MyApp extends StatelessWidget {
  final IoC ioC;

  const MyApp({Key key, this.ioC}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("auth") as AuthenticationBloc),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("home_feeds") as HomeFeedsBloc),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("following") as FollowingPostBloc),
        ),
        BlocProvider.value(
            value: (ioC.getBloc("notification") as NotificationBloc))
      ],
      child: Builder(
        builder: (context) {
          print("built main");
          return MaterialApp(
            home: FutureBuilder(
                future:
                    BlocProvider.of<AuthenticationBloc>(context).checkAuth(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Scaffold(
                      body: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var state = snapshot.data as AuthenticationState;
                      if (state is AuthenticatedState) {
                        return HomeScreen();
                      }
                      if (state is NotAuthenticatedState) {
                        return AuthScreen();
                      }
//                    (snapshot.connectionState == ConnectionState.waiting)

                    }
                  }
                }),
            routes: appRoutes,
            theme: !context.watch<ThemeCubit>().state
                ? ThemeData.light().copyWith(
                    scaffoldBackgroundColor: Colors.white,
                  )
                : ThemeData.dark(),
          );
        },
      ),
    );
  }
}
