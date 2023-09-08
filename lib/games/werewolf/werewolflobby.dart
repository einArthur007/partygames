import 'package:flutter/material.dart';
import 'package:partygames/models/button.dart';
import 'package:partygames/pages/layout.dart';
import 'package:partygames/funktion.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:partygames/global.dart';

class WerewolfLobby extends StatelessWidget {
  WerewolfLobby({super.key});

  final channel = WebSocketChannel.connect(
  Uri.parse('ws://$hostURL:8080'),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Layout(heading: 'Werwolf'),
          Button(
            text: 'Click',
            onTap: () {
              print(werewolfPlayer);
            },
          ),
          Button(
            text: 'Bereit',
            onTap: () {
              channel.sink.add('WerewolfRedy');
            },
          ),
        ],
      ),
    );
  }
}
