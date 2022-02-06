import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      initialRoute: WelcomeScreen.welcomeScreenId,
      routes: {
        ChatScreen.chatScreenId: (_) => const ChatScreen(),
        LoginScreen.loginScreenId: (_) => const LoginScreen(),
        WelcomeScreen.welcomeScreenId: (_) => const WelcomeScreen(),
        RegistrationScreen.registrationScreenId: (_) =>
            const RegistrationScreen(),
      },
    );
  }
}
