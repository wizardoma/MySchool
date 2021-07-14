import 'package:app/domain/feeds/homefeeds_client.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';

class HomeFeedsService extends Service{
  final HomeFeedsClient _feedsClient;
  HomeFeedsService(this._feedsClient);

  Future<ResponseEntity> fetchFeeds() async {
    return await _feedsClient.fetchFeeds();
  }
}