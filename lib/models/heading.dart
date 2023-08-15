import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.text,
    required this.fontSize,
  });
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      )),
    );
  }
}
