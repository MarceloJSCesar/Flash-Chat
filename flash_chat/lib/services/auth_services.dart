import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _instance = FirebaseFirestore.instance;
  Future<User> register() async {}
  Future login() async {}
}
