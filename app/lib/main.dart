import 'package:app/application/auth/auth_bloc.dart';
import 'package:app/application/auth/auth_event.dart';
import 'package:app/application/auth/auth_state.dart';
import 'package:app/application/event/event_bloc.dart';
import 'package:app/application/following/following_posts_bloc.dart';
import 'package:app/application/post/posts_bloc.dart';
import 'package:app/application/notification/notification_bloc.dart';
import 'package:app/application/space/spaces_bloc.dart';
import 'package:app/application/theme/theme_cubit.dart';
import 'package:app/application/trends/trends_bloc.dart';
import 'package:app/application/user/user_bloc.dart';
import 'package:app/commons/routes.dart';
import 'package:app/commons/styles.dart';
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
          value: (ioC.getBloc("auth") as AuthenticationBloc)
            ..add(AppStartedEvent()),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("user") as UserBloc),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("home_feeds") as PostBloc),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("trend") as TrendsBloc),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("following") as FollowingPostBloc),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("space") as SpaceBloc),
        ),
        BlocProvider.value(
          value: (ioC.getBloc("event") as EventBloc),
        ),
        BlocProvider.value(
            value: (ioC.getBloc("notification") as NotificationBloc))
      ],
      child: Builder(
        builder: (context) {
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
                    var state = snapshot.data as AuthenticationState;
                    if (state is AuthenticatedState) {
                      return HomeScreen();
                    }
                    if (state is NotAuthenticatedState) {
                      return AuthScreen();
                    }
                  }
                }),
            routes: appRoutes,
            theme: customTheme(context.watch<ThemeCubit>().state),
          );
        },
      ),
    );
  }
}
