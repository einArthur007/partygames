import 'package:flutter/material.dart';

class RandomCard extends StatelessWidget {
  const RandomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Image.asset('assets/Werewolf/doppelgaengerin.png'),
    );
  }
}
