import 'package:flash_chat/config/app_textstyles.dart';
import 'package:flutter/material.dart';

class MessageBuble extends StatelessWidget with AppTextStyles {
  final String msg;
  final String email;
  final bool isSender;
  const MessageBuble({
    Key? key,
    required this.msg,
    required this.email,
    required this.isSender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            email,
            style: AppTextStyles.messageTitleTextStyle,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            //alignment: isSender ? Alignment.bottomRight : Alignment.bottomLeft,
            decoration: BoxDecoration(
              color: isSender ? Colors.lightBlue : Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              msg,
              style: AppTextStyles.messageTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
