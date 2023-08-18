import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Beon',
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
    );
  }
}
