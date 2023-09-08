import 'package:flutter/material.dart';
import 'package:partygames/funktion.dart';
import 'package:partygames/models/button.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:partygames/global.dart';

class ChooseWerewolf extends StatefulWidget {
  ChooseWerewolf({super.key});

  @override
  State<ChooseWerewolf> createState() => _ChooseWerewolfState();
}
@override
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://echo.websocket.events'),
    );

class _ChooseWerewolfState extends State<ChooseWerewolf> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Container(
        alignment: Alignment.center,
        child: Button(
          text: 'Werwolf',
          onTap: () {
            channel.sink.add('joinWerewolf');
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            );
          },
        ),
      ),
    );
  }
}

//  ws://$hostURL:8080