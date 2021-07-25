import 'package:app/application/auth/login_request.dart';
import 'package:app/application/auth/signup_request.dart';
import 'package:app/domain/auth/authentication_client.dart';
import 'package:app/domain/auth/model/authUser.dart';
import 'package:app/domain/response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// author: Ibekason Alexander

class FirebaseAuthService extends AuthenticationClient {
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
  Future<ResponseEntity> checkAuthentication() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    var authUser = AuthUser.fromFirebaseUser(auth.currentUser);
    if (authUser == null) {
      return ResponseEntity.Error(null);
    } else {
      return ResponseEntity.Data(authUser);
    }
  }

  @override
  void logout() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }

  @override
  Future<ResponseEntity> loginWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

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
    } on PlatformException catch (e) {
      return ResponseEntity.Error(e.code);
    } catch (e) {
      return ResponseEntity.Error("An error occurred signing you in");
    }

    if (user == null) {
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
        return ResponseEntity.Error("An error occurred while registering");
      } else {
        return ResponseEntity.Data(
            AuthUser.fromFirebaseUser(userCredential.user));
      }
    } on FirebaseAuthException catch (e) {
      return ResponseEntity.Error(e.message);
    } catch (e) {
      return ResponseEntity.Error(
        "There was an error signing you up",
      );
    }
  }

  @override
  Future<void> delete() {
    var firebaseAuth = FirebaseAuth.instance;
    if (firebaseAuth.currentUser != null) {
      firebaseAuth.currentUser.delete();
    }
  }
}
