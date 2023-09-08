import 'package:flutter/material.dart';
import 'package:partygames/models/button.dart';

class ChooseDixit extends StatelessWidget {
  const ChooseDixit({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Container(
        alignment: Alignment.center,
        child: Button(
          text: 'Dixit',
          onTap: () {},
        ),
      ),
    );
  }
}
