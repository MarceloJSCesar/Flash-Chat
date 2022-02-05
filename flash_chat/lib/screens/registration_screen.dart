import 'package:flash_chat/widgets/custom_button.dart';
import 'package:flash_chat/widgets/logo_image.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  static const String registrationScreenId = 'registration_screen';
  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const LogoImage(height: 200.0),
            const SizedBox(
              height: 48.0,
            ),
            CustomTextField(
              hint: 'Enter your email',
              onChanged: () {},
            ),
            const SizedBox(
              height: 8.0,
            ),
            CustomTextField(
              onChanged: () {},
            ),
            const SizedBox(
              height: 24.0,
            ),
            const CustomButton(
              isLoginButton: false,
            )
          ],
        ),
      ),
    );
  }
}
