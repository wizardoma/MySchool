import '../../domain/post/post.dart';
import 'package:app/domain/space/space.dart';

abstract class SpaceState {}

class SpaceStateUnInitialized extends SpaceState {}

class FetchingSpaceState extends SpaceState {}

class FetchSpaceStateSuccess extends SpaceState {
  final List<Space> spaces;

  FetchSpaceStateSuccess(this.spaces);
}

class FetchSpaceStateFailure extends SpaceState {
  final String error;

  FetchSpaceStateFailure(this.error);
}