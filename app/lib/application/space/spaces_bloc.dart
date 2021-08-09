import 'dart:async';

import 'package:app/application/space/spaces_event.dart';
import 'package:app/application/space/spaces_state.dart';
import 'package:app/application/user/user_bloc.dart';
import 'package:app/application/user/user_state.dart';
import 'package:app/domain/space/space.dart';
import 'package:app/domain/space/space_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  final SpaceService _spaceService;
  final UserBloc _userBloc;
  StreamSubscription _streamSubscription;

  List<Space> _userSpaces;
  Space _singleSpace;

  SpaceBloc(this._spaceService, this._userBloc)
      : super(SpaceStateUnInitialized()) {
    _streamSubscription = _userBloc.stream.listen((state) {
      if (state is FetchedUserState) {
        add(FetchSpaceByUserEvent(state.user.id));
      }
    });
  }

  @override
  Stream<SpaceState> mapEventToState(SpaceEvent event) async* {
    if (event is FetchSpaceByUserEvent) {
      yield FetchingSpaceState();
      yield await fetchSpacesByUser(event.userId);
    }

    if (event is FetchSingleSpaceEvent){
      yield FetchingSpaceState();
      yield await fetchSpaceById(event.spaceId);
    }
  }

  Future<SpaceState> fetchSpaceById(int spaceId)async{
    var responseEntity = await _spaceService.fetchSpaceById(spaceId);
    if (responseEntity.isError) {
      return FetchSingleSpaceFailureState(responseEntity.errors.message);

    }

    _singleSpace = responseEntity.data;
    return FetchSingleSpaceSuccessState(responseEntity.data);

  }

  Future<SpaceState> fetchSpacesByUser(String userId) async {
    var responseEntity = await _spaceService.fetchSpacesByUser(userId);
    if (responseEntity.isError) {
      return FetchSpaceStateFailure(responseEntity.errors.message);
    }
    _userSpaces= responseEntity.data;

    return FetchSpaceStateSuccess(responseEntity.data);
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  List<Space> get userSpaces => _userSpaces;
}
