import 'package:flutter/material.dart';
import 'package:partygames/games/werewolf/pages/blackscreen.dart';
import 'package:partygames/games/werewolf/pages/getcard.dart';
import 'package:partygames/funktion.dart';

class Werewolf extends StatefulWidget {
  const Werewolf({super.key});

  @override
  State<Werewolf> createState() => _WerewolfState();
}

class _WerewolfState extends State<Werewolf> {
  Widget? refresh;

  @override
  Widget build(BuildContext context) {
    if (werewolfPageTransition == 0) {
      refresh = const GetCard();
      setState(() {});
    }
    if (werewolfPageTransition == 1) {
      refresh = Blackscreen(
        setNewPage: () {
          werewolfPageTransition++;
          setState(() {});
        },
      );
      setState(() {});
    }
    return AnimatedSwitcher(
      duration: const Duration(seconds: 5),
      child: refresh!,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }
}
