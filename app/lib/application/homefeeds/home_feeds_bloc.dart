import 'package:app/application/homefeeds/homefeeds_event.dart';
import 'package:app/application/homefeeds/homefeeds_state.dart';
import 'package:app/domain/feeds/posts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeedsBloc extends Bloc<HomeFeedsEvent, HomeFeedsState> {
  final PostService homeFeedsService;

  HomeFeedsBloc(this.homeFeedsService) : super(HomeFeedsUnInitializedState());

  @override
  Stream<HomeFeedsState> mapEventToState(HomeFeedsEvent event) async* {
    if (event is FetchHomeFeedsEvent) {
      yield FetchingHomeFeedsState();
      yield await fetchHomeFeeds();
    }
  }

  Future<HomeFeedsState> fetchHomeFeeds() async {
    var response = await homeFeedsService.fetchFeeds();

    if (!response.isError) {
      return FetchHomeFeedsSuccessState(response.data);
    }
  }
}
