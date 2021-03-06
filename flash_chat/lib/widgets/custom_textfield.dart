import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final Function onChanged;
  const CustomTextField({
    Key? key,
    this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hint == null ? true : false,
      textInputAction:
          hint == null ? TextInputAction.done : TextInputAction.next,
      keyboardType: hint == null
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      onChanged: (value) => onChanged(value),
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint ?? 'Enter your password.',
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
