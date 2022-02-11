import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/services/auth_services.dart';
import 'package:flash_chat/widgets/custom_button.dart';
import 'package:flash_chat/widgets/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../widgets/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  static const String registrationScreenId = 'registration_screen';
  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin, AuthServices {
  AnimationController? _animationController;
  Animation? _animation;

  String? _email;
  String? _password;

  bool isLoading = false;

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
      backgroundColor: _animation?.value,
      body: isLoading
          ? ModalProgressHUD(
              inAsyncCall: isLoading, child: const Text('Loading ...'))
          : Padding(
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
                  const SizedBox(
                    height: 24.0,
                  ),
                  CustomButton(
                    isLoginButton: false,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await register(
                              email: _email as String,
                              password: _password as String)
                          .then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        if (value != null) {
                          Navigator.of(context)
                              .pushReplacementNamed(ChatScreen.chatScreenId);
                        }
                      });
                    },
                  )
                ],
              ),
            ),
    );
  }
}
