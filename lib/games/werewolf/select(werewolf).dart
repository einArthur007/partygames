import 'dart:math';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:partygames/games/werewolf/pages/getcard.dart';
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

Color border = Colors.transparent;

final List<String> growableList = [];

List<Widget> createCharakterWidgets(Function setState, context) {
  List<Widget> returnList = [];
  for (int i = 0; i < charakters.length; i++) {
    returnList.add(
      GestureDetector(
        onTap: () {
          int werewolfNumber = Random().nextInt(5) + 1;
          growableList.add(charakters[i]['charakter'].toLowerCase());
          if (charakters[i]['charakter'] == 'Dorfbewohner') {
            charakters.insert(
              13,
              {
                'charakter': 'Dorfbewohner',
                'image': 'dorfbewohner$werewolfNumber.png',
                'removeable': true,
                'border': Theme.of(context).primaryColorLight,
              },
            );
          }
          if (charakters[i]['charakter'] == 'Werwolf') {
            charakters.insert(
              2,
              {
                'charakter': 'Werwolf',
                'image': 'werewolf$werewolfNumber.png',
                'removeable': true,
                'border': Theme.of(context).primaryColorLight,
              },
            );
          }

          setState(() {});
        },
        onDoubleTap: () {
          if (charakters[i]['removeable']) {
            charakters.removeAt(i);
            growableList.removeAt(i);
          }
          setState(() {});
        },
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/Werewolf/${charakters[i]['image']}'),
            ),
            Center(
              child: Text(
                charakters[i]['charakter'],
              ),
            ),
          ],
        ),
      ),
    );
  }
  return returnList;
}

List<Map<String, dynamic>> charakters = [
  {
    'charakter': 'Doppelgänger',
    'image': 'doppelgaengerin.png',
    'removeable': false,
  },
  {
    'charakter': 'Werwolf',
    'image': 'werewolf1.png',
    'removeable': false,
  },
  {
    'charakter': 'Günstling',
    'image': 'guenstling.png',
    'removeable': false,
  },
  {
    'charakter': 'Freimaurer',
    'image': 'freimaurer1.png',
    'removeable': false,
  },
  {
    'charakter': 'Seherin',
    'image': 'seherin.png',
    'removeable': false,
  },
  {
    'charakter': 'Räuber',
    'image': 'raeuber.png',
    'removeable': false,
  },
  {
    'charakter': 'Unruhestifterin',
    'image': 'unruhestifterin1.png',
    'removeable': false,
  },
  {
    'charakter': 'Betrunkener',
    'image': 'betrunkener.png',
    'removeable': false,
  },
  {
    'charakter': 'Schlaflose',
    'image': 'schlaflose.png',
    'removeable': false,
  },
  {
    'charakter': 'Jäger',
    'image': 'jaeger.png',
    'removeable': false,
  },
  {
    'charakter': 'Gerber',
    'image': 'gerber.png',
    'removeable': false,
  },
  {
    'charakter': 'Dorfbewohner',
    'image': 'dorfbewohner1.png',
    'removeable': false,
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
              childAspectRatio: (0.90 / 1),
              children: [
                ...createCharakterWidgets(setState, context),
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
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: const GetCard()));
            },
            text: 'Fertig',
          ),
        )
      ],
    );
  }
}
