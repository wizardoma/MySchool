import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';
import 'package:app/domain/trends/trend.dart';

class TrendService extends Service {
  Future<ResponseEntity> fetchTrends() async {
    return await Future.delayed(
      Duration(seconds: 2),
      () => ResponseEntity.Data(
        trendsList,
      ),
    );
  }
}
