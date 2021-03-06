import 'package:app/domain/space/space.dart';

abstract class SpaceState {}

class SpaceStateUnInitialized extends SpaceState {}

class SpaceLoadingState extends SpaceState {}

class FetchSpaceStateSuccess extends SpaceState {
  final List<Space> spaces;

  FetchSpaceStateSuccess(this.spaces);
}

class FetchSpaceStateFailure extends SpaceState {
  final String error;

  FetchSpaceStateFailure(this.error);
}

class FetchSingleSpaceSuccessState extends SpaceState {
  final Space space;

  FetchSingleSpaceSuccessState(this.space);
}

class FetchSingleSpaceFailureState extends SpaceState {
  final String errorMessage;

  FetchSingleSpaceFailureState(this.errorMessage);
}
