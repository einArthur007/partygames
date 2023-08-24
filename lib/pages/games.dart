import 'package:flutter/material.dart';
import 'package:partygames/funktion.dart';
import 'package:page_transition/page_transition.dart';
import 'package:partygames/games/werewolf.dart';
import 'package:partygames/games/dixit.dart';

class Games extends StatelessWidget {
  const Games({
    super.key,
    required this.fontColor,
  });
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> buttons = [
      {
        'game': 'Werwolf',
        'player': playerNumber,
        'round': roundCounter,
        'link': const Werewolf(),
      },
      {
        'game': 'Dixit',
        'player': playerNumber,
        'round': roundCounter,
        'link': const Dixit(),
      }
    ];
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ...buttons.map(
                      (e) => Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: GestureDetector(
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
                                borderRadius: BorderRadius.circular(40),
/*                                 border: Border.all(
                                  color: fontColor,
                                ), */
                                color: Theme.of(context).cardColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    e['game'],
                                    style: TextStyle(
                                      color: fontColor,
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'player:',
                                                style: TextStyle(
                                                  color: fontColor,
                                                ),
                                              ),
                                              Text(
                                                (e['player'] as Function)()
                                                    .toString(),
                                                style: TextStyle(
                                                  color: fontColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'round:',
                                                style: TextStyle(
                                                  color: fontColor,
                                                ),
                                              ),
                                              Text(
                                                (e['round'] as Function)()
                                                    .toString(),
                                                style: TextStyle(
                                                  color: fontColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
