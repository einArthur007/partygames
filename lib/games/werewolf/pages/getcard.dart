import 'package:partygames/models/led.dart';
import 'package:partygames/pages/layout.dart';
import 'package:flutter/material.dart';
import 'package:partygames/games/werewolf/pages/timer.dart';

class GetCard extends StatelessWidget {
  const GetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LED(
          color: Theme.of(context).primaryColorLight,
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ),
        const Layout(heading: 'Doppelgängerin'), // jewailiger Charakter
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Image.asset('assets/Werewolf/1.png'), // zufälliger Charakter
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: const Timer(),
        ),
      ],
    );
    ;
  }
}
