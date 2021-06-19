import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/domain/auth/authentication_service.dart';
import 'package:app/domain/auth/model/user.dart';
import 'package:app/domain/response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService extends AuthenticationService {
  @override
  Future<ResponseEntity> login(LoginRequest request) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: request.email, password: request.password);
    } on FirebaseAuthException catch (e) {
      return ResponseEntity.Error(e.message);
    }

    return ResponseEntity.Data(AuthUser.fromFirebaseUser(userCredential.user));
  }

  @override
  Future<AuthUser> checkAuthentication() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    return AuthUser.fromFirebaseUser(auth.currentUser);
  }

  @override
  void logout() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }

  @override
  Future<ResponseEntity> googleSignIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    try {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );


        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
          return ResponseEntity.Error(e.message);

      }
      on PlatformException catch (e) {
        return ResponseEntity.Error(e.code);
      }

      catch (e) {
        return ResponseEntity.Error("An error occurred signing you in");
      }


    return ResponseEntity.Data(AuthUser.fromFirebaseUser(user));
  }

  @override
  Future<ResponseEntity> signUp(SignUpRequest signUpRequest) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: signUpRequest.email, password: signUpRequest.password);
      if (userCredential.user == null) {
        return ResponseEntity.Error("An error occured while registering");
      }
    } on FirebaseAuthException catch (e) {
      return ResponseEntity.Error(e.message);
    }

    return ResponseEntity.Data(AuthUser.fromFirebaseUser(userCredential.user));
  }
}
