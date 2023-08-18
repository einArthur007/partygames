import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:partygames/funktion.dart';
import 'package:page_transition/page_transition.dart';
import 'package:partygames/games/werewolf.dart';
import 'package:partygames/games/dixit.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> buttons = [
      {
        'game': 'Werwolf',
        'player': playerNumber,
        'round': roundCounter,
        'link': Werewolf(),
      },
      {
        'game': 'Dixit',
        'player': playerNumber,
        'round': roundCounter,
        'link': Dixit(),
      }
    ];

    

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          ...buttons.map(
            (e) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: e['link'],
                    type: PageTransitionType.leftToRightWithFade,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).shadowColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(e['game']),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text('player:'),
                            Text((e['player'] as Function)().toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('round:'),
                            Text((e['round'] as Function)().toString()),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
