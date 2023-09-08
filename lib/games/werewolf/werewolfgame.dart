import 'dart:math';
import 'package:flutter/material.dart';
import 'package:partygames/models/button.dart';

class Werewolf extends StatelessWidget {
  Werewolf({super.key});

  var intValue = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Button(
        onTap: () {
          intValue;
          print(intValue);
        },
        text: 'bekomme eine Rolle',
      ),
    );
  }
}
