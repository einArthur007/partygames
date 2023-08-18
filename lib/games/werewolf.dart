import 'package:flutter/material.dart';
import 'package:partygames/models/heading.dart';

class Werewolf extends StatelessWidget {
  const Werewolf({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Heading(text: 'Werewolf'),
    );
  }
}