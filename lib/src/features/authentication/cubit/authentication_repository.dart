import 'package:firebase_authentication/src/features/authentication/model/user_request_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  Future<UserCredential?>login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (ex) {
      return null;
    }
  }

  Future<UserCredential?> signup(UserRequestModel userRequestModel) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userRequestModel.email,
              password: userRequestModel.password);
      return userCredential;
    } catch (ex) {
      return null;
    }
  }


}
