import 'package:flash_chat/config/app_textstyles.dart';
import 'package:flash_chat/widgets/animate_title.dart';
import 'package:flash_chat/widgets/custom_button.dart';
import 'package:flash_chat/widgets/logo_image.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String welcomeScreenId = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin, AppTextStyles {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(_animationController as AnimationController);

    _animationController!.forward();
    _animationController!.addListener(() {
      setState(() {});
    });
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
            Row(
              children: const <Widget>[
                LogoImage(height: 60.0),
                AnimateTitle(),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            const CustomButton(),
            const CustomButton(isLoginButton: false),
          ],
        ),
      ),
    );
  }
}
