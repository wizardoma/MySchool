import 'package:app/application/homefeeds/homefeeds_event.dart';
import 'package:app/application/homefeeds/homefeeds_state.dart';
import 'package:app/domain/feeds/homefeeds_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeedsBloc extends Bloc<HomeFeedsEvent, HomeFeedsState> {
  final HomeFeedsService homeFeedsService;

  HomeFeedsBloc(this.homeFeedsService) : super(HomeFeedsUnInitializedState());

  @override
  Stream<HomeFeedsState> mapEventToState(HomeFeedsEvent event) async* {
    if (event is FetchHomeFeedsEvent) {
      yield FetchingHomeFeedsState();
      yield await fetchHomeFeeds();
    }
  }

  Future<HomeFeedsState> fetchHomeFeeds() async {
    print("fetching feeds");
    var response = await homeFeedsService.fetchFeeds();
    print("response :${response.isError}");

    if (!response.isError) {
      return FetchHomeFeedsSuccessState(response.data);
    }
  }
}
