import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.labelText,
    required this.password,
  });
  final String labelText;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
      width: MediaQuery.of(context).size.width,
        child: TextField(
          obscureText: password,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            
          ),
        ),
      ),
    );
  }
}
