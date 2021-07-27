import 'package:app/application/trends/trends_event.dart';
import 'package:app/application/trends/trends_state.dart';
import 'package:app/domain/trends/trends_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendsBloc extends Bloc<TrendsEvent, TrendsState> {
  final TrendService _trendService;

  TrendsBloc(this._trendService) : super(TrendsStateNotInitializedState());

  @override
  Stream<TrendsState> mapEventToState(TrendsEvent event) async* {
    if (event is FetchTrendsEvent) {
      yield FetchingTrendsState();
      yield await fetchTrends();
    }
  }

  Future<TrendsState> fetchTrends() async {
    var responseEntity = await _trendService.fetchTrends();
    print(responseEntity);
    return responseEntity.isError
        ? FetchTrendsErrorState(responseEntity.errors.message)
        : FetchedTrendsSuccessState(responseEntity.data);
  }
}
