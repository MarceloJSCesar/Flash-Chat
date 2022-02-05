import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../config/app_textstyles.dart';

class AnimateTitle extends StatelessWidget with AppTextStyles {
  const AnimateTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 4,
      pause: const Duration(milliseconds: 50),
      animatedTexts: [
        TypewriterAnimatedText(
          'Flash Chat',
          textStyle: AppTextStyles.welcomeScreenTitleTextStyle,
          speed: const Duration(milliseconds: 250),
        ),
      ],
    );
  }
}
