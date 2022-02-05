import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final String? tag;
  final double height;
  const LogoImage({
    Key? key,
    this.tag,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? 'logo',
      child: SizedBox(
        height: height,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
