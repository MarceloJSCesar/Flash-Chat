import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/person.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

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

  Future logout({required BuildContext context}) async {
    try {
      await _auth.signOut();
      Navigator.of(context).pushReplacementNamed(WelcomeScreen.welcomeScreenId);
    } catch (errorMsg) {
      // ignore: avoid_print
      print('errorLogoutMsg: $errorMsg');
    }
  }
}
