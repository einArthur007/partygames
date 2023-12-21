import 'package:flutter/material.dart';
import 'package:partygames/models/button.dart';
import 'package:partygames/models/led.dart';
import 'package:partygames/pages/layout.dart';
import 'package:partygames/funktion.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:partygames/global.dart';

class WerewolfLobby extends StatelessWidget {
  WerewolfLobby({super.key});

  final channel = WebSocketChannel.connect(
    Uri.parse('ws://$hostUrl:8080'),
  );

  @override
  Widget build(BuildContext context) {
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
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Button(
              text: 'Click',
              onTap: () {
                print(werewolfPlayer);
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Button(
              text: 'Bereit',
              onTap: () {
                channel.sink.add('WerewolfRedy');
              },
            ),
          ),
        ],
      ),
    );
  }
}
