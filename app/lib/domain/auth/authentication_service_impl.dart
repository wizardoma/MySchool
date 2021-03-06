import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/commons/api.dart';
import 'package:app/domain/auth/authentication_client.dart';
import 'package:app/domain/auth/authentication_service.dart';
import 'package:app/domain/auth/model/authUser.dart';
import 'package:app/domain/auth/model/signUpUser.dart';
import 'package:app/domain/response.dart';
import 'package:dio/dio.dart';
import 'package:http_code_util/http_code_util.dart';

/// Author: Ibekason Alexander

class AuthenticationServiceImpl extends AuthenticationService
    with StatusCodeUtil {
  AuthenticationServiceImpl(AuthenticationClient authenticationClient)
      : super(authenticationClient);

  @override
  Future<ResponseEntity> checkAuthentication() async {
    var responseEntity = await authenticationClient.checkAuthentication();
    return responseEntity;
  }

  @override
  Future<ResponseEntity> login(LoginRequest request) async {
    var responseEntity = await authenticationClient.login(request);
    return responseEntity;
  }

  @override
  Future<ResponseEntity> loginWithGoogle() async {
    var responseEntity = await authenticationClient.loginWithGoogle();
    return responseEntity;
  }

  @override
  void logout() async {
    authenticationClient.logout();
  }

  @override
  Future<ResponseEntity> signUp(SignUpRequest signUpRequest) async {
    var response = await authenticationClient.signUp(signUpRequest);
    if (response.isError) return response;
    var userData = SignUpUser(
        id: (response.data as AuthUser).id,
        email: signUpRequest.email,
        departmentId: int.parse(signUpRequest.departmentId),
        matricNo: signUpRequest.matricNo,
        level: signUpRequest.level,
        universityId: int.parse(signUpRequest.universityId),
        name: signUpRequest.name);

    Response serverResponse;
    try {
      serverResponse = await dioClient.post("/students",
          data: FormData.fromMap(userData.toMap()));
      return ResponseEntity.Data(userData);
    } on DioError catch (e) {
      authenticationClient.delete();
      print("DioError: ${e.error} data: ${e.response.data}");
      var errorSummary = e.response.data ? e.response.data["errors"]["summary"] ??
          "An error occurred fetching user" : "An error occurred fetching user";

      return ResponseEntity.Error(errorSummary);
    } catch (e) {
      authenticationClient.delete();
      print("Exception ${e.response}");
      return ResponseEntity.Error("An error occurred trying to register");
    }
  }
}
