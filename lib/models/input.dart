import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({
    super.key,
    required this.labelText,
    required this.password,
    required this.controller,
    this.hintText,
  });
  final String labelText;
  String? hintText;
  final bool password;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColorLight,
      style: TextStyle(
        color: Theme.of(context).highlightColor,
      ),
      controller: controller,
      obscureText: password,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).shadowColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).shadowColor,
        ),
        hintText: hintText,
      ),
    );
  }
}
