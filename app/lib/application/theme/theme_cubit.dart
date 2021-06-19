import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(false);

  void setTheme() {
    print("emiting new state from $state");

    emit(!state);
    print("to $state");
  }

  @override
  bool fromJson(Map<String, dynamic> json) {
    return json["theme"] as bool;
  }

  @override
  Map<String, dynamic> toJson(bool state) {
    return {
      "theme": state
    };
  }

}