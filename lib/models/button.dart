import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.border,
  });
  final String text;
  final dynamic border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
