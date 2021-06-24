import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/domain/auth/authentication_client.dart';
import 'package:app/domain/auth/authentication_service.dart';
import 'package:app/domain/auth/firebase_auth_service.dart';
import 'package:app/domain/auth/model/authUser.dart';
import 'package:app/domain/auth/model/signUpUser.dart';
import 'package:app/domain/response.dart';
import 'package:dio/dio.dart';
import 'package:http_code_util/http_code_util.dart';

/// Author: Ibekason Alexander

class AuthenticationServiceImpl extends AuthenticationService with StatusCodeUtil {
  AuthenticationServiceImpl(AuthenticationClient authenticationClient) : super(authenticationClient);


  @override
  Future<ResponseEntity> checkAuthentication() async {
    var responseEntity = await authenticationClient.checkAuthentication();
    return responseEntity;
  }

  @override
  Future<ResponseEntity> login(LoginRequest request) async{
    var responseEntity = await authenticationClient.login(request);
    return responseEntity;
  }

  @override
  Future<ResponseEntity> loginWithGoogle() async{
    var responseEntity = await authenticationClient.loginWithGoogle();
    return responseEntity;
  }

  @override
  void logout() async{
    authenticationClient.logout();
  }

  @override
  Future<ResponseEntity> signUp(SignUpRequest signUpRequest) async{
    var response =await authenticationClient.signUp(signUpRequest);
    print("response from firebase + $response");
    if (response.isError) {
      return response;
    }

    if (authenticationClient is FirebaseAuthService){
      try {
        var userData = SignUpUser(
              id: (response.data as AuthUser).id,
              email: signUpRequest.email,
              department: signUpRequest.department,
              level: signUpRequest.level,
              university: signUpRequest.university,
              name: signUpRequest.name
            ).toMap();
        print(userData);
        await Dio(BaseOptions(
          connectTimeout: 15000,receiveTimeout: 15000
        )).post("https://myschool-project.herokuapp.com/api/v1/students",
            data: FormData.fromMap(userData));
        return response;

      }
      on DioError catch(e) {
        authenticationClient.delete();
        print("DioError: ${e.error}");
        return ResponseEntity.Error("An error occurred trying to register");
      }

      catch (e) {
        authenticationClient.delete();
        print("Exception ${e.response}");
        return ResponseEntity.Error("An error occurred trying to register");

      }
    }
  }

}