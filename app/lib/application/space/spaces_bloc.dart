import 'package:app/application/following/following_posts_event.dart';
import 'package:app/application/following/following_posts_state.dart';
import 'package:app/application/space/spaces_event.dart';
import 'package:app/application/space/spaces_state.dart';
import 'package:app/domain/post/posts_service.dart';
import 'package:app/domain/space/space_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  final SpaceService _spaceService;

  SpaceBloc(this._spaceService)
      : super(SpaceStateUnInitialized());

  @override
  Stream<SpaceState> mapEventToState(SpaceEvent event) async* {
    if (event is FetchSpaceEvent) {
      yield FetchingSpaceState();
      yield await fetchSpaces();
    }
  }

  Future<SpaceState> fetchSpaces() async {
    var responseEntity = await _spaceService.fetchSpaces();
    if (responseEntity.isError) {
      return FetchSpaceStateFailure(responseEntity.errors.message);
    }
    return FetchSpaceStateSuccess(responseEntity.data);
  }
}
