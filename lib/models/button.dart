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
      padding: EdgeInsets.only(
        top: 25,
        bottom: 25,
        left: MediaQuery.of(context).size.width*0.25,
        right: MediaQuery.of(context).size.width*0.25,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}