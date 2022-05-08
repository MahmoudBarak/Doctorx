
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  void registerWithEmail(String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await prefs.setString('userId', userCredential.user!.uid);
      print(userCredential.user!.uid);
      print("Creating Account succ${userCredential.user!.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


}
