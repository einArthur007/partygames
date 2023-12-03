import 'package:flutter/material.dart';
import 'package:partygames/models/button.dart';
import 'package:partygames/models/led.dart';
import 'package:partygames/pages/layout.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

final channel = WebSocketChannel.connect(
  Uri.parse(
      'wss://echo.websocket.events'), // websocketserver ip muss noch da hin
);

final List<String> growableList = [];

List<Map<String, dynamic>> charakters = [
  {
    'charakter': 'Doppelgänger',
    'image': 'doppelgaengerin.png',
  },
  {
    'charakter': 'Werwolf',
    'image': 'werewolf1.png',
  },
  {
    'charakter': 'Werwolf',
    'image': 'werewolf2.png',
  },
  {
    'charakter': 'Günstling',
    'image': 'guenstling.png',
  },
  {
    'charakter': 'Freimaurer',
    'image': 'freimaurer1.png',
  },
  {
    'charakter': 'Freimaurer',
    'image': 'freimaurer2.png',
  },
  {
    'charakter': 'Seherin',
    'image': 'seherin.png',
  },
  {
    'charakter': 'Räuber',
    'image': 'raeuber.png',
  },
  {
    'charakter': 'Unruhestifterin',
    'image': 'unruhestifterin1.png',
  },
  {
    'charakter': 'Betrunkener',
    'image': 'betrunkener.png',
  },
  {
    'charakter': 'Schlaflose',
    'image': 'schlaflose2.png',
  },
];

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LED(
          color: Theme.of(context).primaryColorLight,
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ),
        const Layout(heading: 'Charakter'),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(40),
              crossAxisSpacing: 70,
              mainAxisSpacing: 70,
              childAspectRatio: (1 / 1),
              children: [
                ...charakters.map(
                  (e) => GestureDetector(
                    onTap: () {
                      growableList.add(e['charakter'].toLowerCase());
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/Werewolf/${e['image']}'),
                        ),
                        Center(
                          child: Text(
                            e['charakter'],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: Button(
            onTap: () {
              channel.sink.add('charakters_Werewolf:');
              channel.sink.add(growableList);
            },
            text: 'Fertig',
          ),
        )
      ],
    );
  }
}
