import 'package:app/domain/response.dart';
import 'package:app/domain/service.dart';
import 'package:app/domain/space/space_client.dart';

class SpaceService extends Service {
  final SpaceClient _spaceClient;

  SpaceService(this._spaceClient);

  Future<ResponseEntity> fetchSpaces() async {
    return await _spaceClient.fetchSpaces();
  }
}
