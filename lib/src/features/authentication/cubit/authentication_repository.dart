import 'package:firebase_authentication/src/features/authentication/model/user_request_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/src/features/authentication/model/user_response_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationRepository {
  Future<UserCredential?> login(String email, String password) async {
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

  addUserToDatabase(UserResponseModel userResponseModel) {
    try {
      CollectionReference userCollection =
          FirebaseFirestore.instance.collection('users');
      userCollection
          .doc(userResponseModel.userId)
          .set(userResponseModel.toJson());
      return true;
    } catch (ex) {
      return false;
    }
  }
}
