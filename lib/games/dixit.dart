import 'package:flutter/material.dart';
import 'package:partygames/models/heading.dart';

class Dixit extends StatelessWidget {
  const Dixit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Heading(text: 'Dixit'),
    );
  }
}