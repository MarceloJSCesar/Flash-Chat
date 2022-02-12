import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/services/auth_services.dart';
import 'package:flash_chat/services/chat_services.dart';
import 'package:flash_chat/widgets/message_buble.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatScreen extends StatefulWidget {
  static const chatScreenId = 'chat_screen';
  const ChatScreen({Key? key}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AuthServices, ChatServices {
  User? user;
  String? message;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _msgController = TextEditingController();
  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async => await logout(context: context),
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, msgSnapshot) {
                switch (msgSnapshot.connectionState) {
                  case ConnectionState.waiting:
                    return ModalProgressHUD(
                      inAsyncCall: true,
                      child: const Text('Loading ...'),
                    );
                  default:
                    if (msgSnapshot.hasData) {
                      final data = msgSnapshot.data!.docs;
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: ListView.builder(
                          reverse: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return MessageBuble(
                              msg: data[index]['text'] as String,
                              email: data[index]['sender'],
                              isSender: data[index]['sender'] == user?.email,
                            );
                          },
                        ),
                      );
                    } else {
                      return const Text('No Message found');
                    }
                }
              },
            ),
          ),
          Container(
            decoration: kMessageContainerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    onChanged: (value) {
                      message = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    _msgController.clear();
                    await sendMsg(msg: message as String, user: user as User);
                  },
                  child: const Text(
                    'Send',
                    style: kSendButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
