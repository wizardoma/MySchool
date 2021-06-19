import 'package:firebase_core/firebase_core.dart';

class FirebaseInitializer {
  static Future<FirebaseApp> init() async {
    return await Firebase.initializeApp();
  }
}