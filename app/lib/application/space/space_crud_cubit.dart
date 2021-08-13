import 'package:app/application/space/spaces_state.dart';
import 'package:app/domain/space/space.dart';
import 'package:app/domain/space/space_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpaceCrudCubit extends Cubit<SpaceState> {
  final SpaceService _spaceService;
  Space _currentSpace;

  SpaceCrudCubit(this._spaceService) : super(SpaceStateUnInitialized());

  Future<Space> fetchSpaceById(int id) async {
    var response = await _spaceService.fetchSpaceById(id);

    if (!response.isError) {
      _currentSpace = response.data;
      emit(FetchSingleSpaceSuccessState(_currentSpace));
      return _currentSpace;
    } else {
      emit(FetchSingleSpaceFailureState(response.errors.message));
      return null;
    }
  }
}
