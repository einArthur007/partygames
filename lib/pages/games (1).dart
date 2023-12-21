import 'package:flutter/material.dart';
import 'package:partygames/models/button.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:partygames/global.dart';
import 'package:http/http.dart' as http;
import 'package:partygames/models/bottomsheet.dart';

class Games2 extends StatefulWidget {
  const Games2({
    super.key,
    required this.fontColor,
  });
  final Color fontColor;

  @override
  State<Games2> createState() => _GamesState();
}

class _GamesState extends State<Games2> {
  @override
  void initState() {
    gameListener();
    super.initState();
  }

  List<dynamic> games = [];
  bool listeningForGames = true;

  gameListener() async {
/*     WebSocketChannel wss = WebSocketChannel.connect(
      Uri.parse('ws://$hostURL:8080'),
    );

    wss.sink.add(jsonEncode({
      'action': 'listen_for_games',
    }));

    wss.stream.listen(
      (message) {
        games = jsonDecode(message);
        setState(() {});
      }, */
      onDone: () {
        games = [];
        setState(() {});
        if (listeningForGames) {
          Future.delayed(const Duration(seconds: 2), gameListener);
        }
      };
    //);
  }

  createGame(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BottomSheets();
      },
    );

    // Uri url = Uri.parse('http://$hostURL:3000/create_game?game_type=werwolf');
    // http.Response res = await http.get(url);
    // print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.78,
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: ListView(
                        key: ValueKey(games),
                        physics: const BouncingScrollPhysics(),
                        children: games.isEmpty
                            ? const [
                                Center(
                                    child: Text('noch keine Spiele vorhanden'))
                              ]
                            : games
                                .map(
                                  (e) => Game(
                                    gameId: e['game_id'],
                                    playerCount: e['players'].length,
                                    gameType: e['game_type'],
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Button(
            text: 'Spiel erstellen',
            onTap: () => createGame(context),
          ),
        ),
      ],
    );
  }
}

class Game extends StatelessWidget {
  const Game({
    super.key,
    required this.gameId,
    required this.playerCount,
    required this.gameType,
  });

  final String gameId;
  final int playerCount;
  final String gameType;

  List<Widget> fadeOutText(
      String text, double? startOpacity, double? fontSize) {
    text += '...';
    startOpacity ??= 1;
    List<Widget> returnWidgets = [];

    for (int i = 0; i < text.length; i++) {
      returnWidgets.add(
        Text(
          text[i],
          style: TextStyle(
            color: Colors.white
                .withOpacity((startOpacity / text.length) * (text.length - i)),
            fontSize: fontSize,
          ),
        ),
      );
    }

    return returnWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.05,
        left: MediaQuery.of(context).size.width * 0.05,
        top: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                gameType,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    gameId.substring(0, 4),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  ...fadeOutText(gameId.substring(4, 16), 0.4, 16),
                ],
              ),
            ],
          ),
          Text(
            '$playerCount Spieler',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
