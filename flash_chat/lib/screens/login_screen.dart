import 'package:flash_chat/widgets/custom_button.dart';
import 'package:flash_chat/widgets/custom_textfield.dart';
import 'package:flash_chat/widgets/logo_image.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const loginScreenId = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController as AnimationController,
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(_animation!.value),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LogoImage(height: _animation!.value * 200),
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
            const SizedBox(height: 24.0),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}
