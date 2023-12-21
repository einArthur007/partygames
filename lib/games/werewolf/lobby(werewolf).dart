import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:partygames/games/werewolf/select(werewolf).dart';
import 'package:partygames/models/button.dart';
import 'package:partygames/models/led.dart';
import 'package:partygames/pages/layout.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:partygames/global.dart';

class WerewolfLobby extends StatefulWidget {
  const WerewolfLobby({super.key});

  @override
  State<WerewolfLobby> createState() => _WerewolfLobbyState();
}

String? buttonText;
bool taped = false;

class _WerewolfLobbyState extends State<WerewolfLobby> {
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://$hostUrl:8080'),
  );

  List<Map<String, dynamic>> player = [
    // hier müssen die Spieler, die bereit sind eingefügt werden
  ];

  @override
  Widget build(BuildContext context) {
    if (taped) {
      buttonText = 'Spiel starten';
    } else {
      buttonText = 'Bereit';
    }

    return Scaffold(
      body: Stack(
        children: [
          LED(
            color: Theme.of(context).primaryColorDark,
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
          LED(
            color: Theme.of(context).primaryColorLight,
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
          const Layout(heading: 'Werwolf'),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(
              MediaQuery.of(context).size.height * 0.2,
            ),
            child: Column(
              children: [
                ...player.map(
                  (e) => Text(e['name']),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Button(
              text: buttonText!,
              onTap: () {
                if (taped == false) {
                  channel.sink.add('WerewolfRedy');
                  player.add(
                    {
                      'name': 'you',
                    },
                  );
                  // Namen des Spielers an Server schicken ich hab keine Ahnung, wie das geht
                }
                if (taped) {
                  channel.sink.add('WerewolfStart');
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Select(),
                      type: PageTransitionType.fade,
                    ),
                  );
                }
                taped = true;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Ready extends StatefulWidget {
  const Ready({super.key});

  @override
  State<Ready> createState() => _ReadyState();
}

class _ReadyState extends State<Ready> {
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://$hostUrl:8080'),
  );

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Button(
        text: 'Bereit',
        onTap: () {},
      ),
    );
  }
}
