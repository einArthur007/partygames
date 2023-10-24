import 'package:flutter/material.dart';
import 'package:partygames/funktion.dart';
import 'package:partygames/games/werewolf/pages/getcard.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();

  static periodic(Duration duration) {}
}

int timerDuration = 2;

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.1,
      ),
      child: Countdown(
        seconds: timerDuration,
        build: (_, werewolfTime) => Text(
          werewolfTime.toString(),
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        interval: const Duration(milliseconds: 100),
        onFinished: () {
          werewolfPageTransition = 1;
          setState(() {
            GetCard();
          });
        },
      ),
    );
  }
}
