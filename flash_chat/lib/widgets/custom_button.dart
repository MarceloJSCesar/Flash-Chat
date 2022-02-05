import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final dynamic onPressed;
  final bool? isLoginButton;
  const CustomButton({
    Key? key,
    this.onPressed,
    this.isLoginButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color:
            isLoginButton == true ? Colors.lightBlueAccent : Colors.blueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            isLoginButton == true ? 'Log In' : 'Register',
          ),
        ),
      ),
    );
  }
}
