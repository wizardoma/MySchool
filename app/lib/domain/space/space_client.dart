import 'package:app/commons/api.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/space/space.dart';
import 'package:dio/dio.dart';

class SpaceClient {


  Future<ResponseEntity> fetchSpacesByUser(String userId) async {
    Response response;
    try {
      response = await dioClient.get(
        "/spaces/users/$userId",
      );

      List<Space> spaces = [];

      response.data["data"].forEach((space) {
        spaces.add(Space.fromServer(space));
      });

      return ResponseEntity.Data(spaces);
    } on DioError catch (e) {
      print("DioError: ${e.error} and ${e.response.data}");
      return ResponseEntity.Error(
          e.response.data["errors"] ?? "An error occurred fetching spaces");
    } catch (e) {
      print("Exception from spaces $e");
      return ResponseEntity.Error("An error occurred fetching spaces");
    }
  }
}