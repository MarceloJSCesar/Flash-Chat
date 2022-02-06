import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/person.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  Future<Person?> register(
      {required String email, required String password}) async {
    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _credential.user!.sendEmailVerification().then((value) {
        value;
      });
      return Person(
        email: email,
        password: password,
      );
    } catch (errorMsg) {
      // ignore: avoid_print
      print('errorRegisterMsg: $errorMsg');
      return null;
    }
  }

  Future<Person?> login(
      {required String email, required String password}) async {
    try {
      UserCredential _credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _credential.user!.sendEmailVerification().then((value) {
        value;
      });
      return Person(
        email: email,
        password: password,
      );
    } catch (errorMsg) {
      // ignore: avoid_print
      print('errorRegisterMsg: $errorMsg');
      return null;
    }
  }
}
