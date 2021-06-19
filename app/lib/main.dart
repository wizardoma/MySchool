import 'package:app/application/theme/theme_cubit.dart';
import 'package:app/commons/routes.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: Builder(
        builder: (context) {
          print("built main");
          return MaterialApp(
              home: HomeScreen(),
              routes: appRoutes,
              theme: context
                  .watch<ThemeCubit>()
                  .state ? ThemeData.light() : ThemeData.dark(),
            );
        },
      ),
    );
  }
}


