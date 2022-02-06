import 'package:flash_chat/services/auth_services.dart';
import 'package:flash_chat/widgets/custom_button.dart';
import 'package:flash_chat/widgets/custom_textfield.dart';
import 'package:flash_chat/widgets/logo_image.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const loginScreenId = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin, AuthServices {
  AnimationController? _animationController;
  Animation? _animation;

  String? _email;
  String? _password;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_animationController as AnimationController);
    _animationController?.forward();
    _animation!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation!.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LogoImage(height: _animationController!.value * 200),
            const SizedBox(
              height: 48.0,
            ),
            CustomTextField(
              hint: 'Enter your email',
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            CustomTextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            const SizedBox(height: 24.0),
            CustomButton(
              onPressed: () async {
                await login(
                  email: _email as String,
                  password: _password as String,
                ).then((value) {
                  if (value != null) {
                    Navigator.of(context)
                        .pushReplacementNamed(ChatScreen.chatScreenId);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
