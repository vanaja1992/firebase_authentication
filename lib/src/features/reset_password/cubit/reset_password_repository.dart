import 'package:firebase_auth/firebase_auth.dart';
class ResetPasswordRepository{

  Future<void> forgotPassword( String email) async{
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email);
    return;
  }
}