import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  final _firestore = FirebaseFirestore.instance;
  Future sendMsg({required String msg, required User user}) async {
    await _firestore.collection('messages').add({
      'text': msg,
      'sender': user.email,
      'createdAt': Timestamp.now(),
    });
  }

  Future fetchMsg() async {
    var messages = await _firestore.collection('messages').get();
    return messages.docs;
  }
}
