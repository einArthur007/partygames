import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:partygames/main.dart';
import 'package:partygames/models/games.dart';
import 'package:partygames/models/heading.dart';
import 'package:partygames/funktion.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  
  late Timer timer;
  int counter = 10;

  void timerStart() {
    counter = 10;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(counter);
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
//          counter = 10;
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Column(
              children: [
                Heading(
                  text: 'Partygames',
                ),
                Center(
                  child: Games(),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
//                Navigator.of(context).push(
//                  PageTransition(
//                    child: MyApp(),
//                    type: PageTransitionType.bottomToTop,
//                  ),
//                );
                timerStart();
              },
              child: const Text(
                'temporär Zurück',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
