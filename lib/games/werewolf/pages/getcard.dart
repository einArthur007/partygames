import 'package:page_transition/page_transition.dart';
import 'package:partygames/games/werewolf/pages/blackscreen.dart';
import 'package:partygames/games/werewolf/pages/randomcard.dart';
import 'package:partygames/models/led.dart';
import 'package:partygames/pages/layout.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GetCard extends StatefulWidget {
  const GetCard({super.key});

  @override
  State<GetCard> createState() => _GetCardState();
}

final channel = WebSocketChannel.connect(
  Uri.parse('wss://echo.websocket.events'), // websocketserver ip muss noch da hin
);

class _GetCardState extends State<GetCard> {
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
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: const Blackscreen()));
              channel.sink.add('ready_Werewolf');
            },
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const RandomCard(),
                ),
                // StreamBuilder(
                //   stream: channel.stream,
                //   builder: (context, snapshot) {
                //     return Text(snapshot.hasData ? '${snapshot.data}' : ''); // aktion mit Oskar besprechen, wie das funktioniert
                //   },
                // ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: const Text('tippen um bereit zu machen'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }
}
