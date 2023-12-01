import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

final growableList = <String>[];

List<Map<String, dynamic>> charakters = [
  {
    'charakter': 'Doppelgänger',
    'image': const AssetImage('assets/Werewolf/doppelgaengerin.png'),
    'onTap': () {
      growableList.add('doppelgaenger');
    },
  },
  {
    'charakter': 'Werwolf',
    'image': const AssetImage('assets/Werewolf/werewolf1.png'),
    'onTap': () {
      growableList.add('werewolf');
    },
  },
  {
    'charakter': 'Werwolf',
    'image': const AssetImage('assets/Werewolf/werewolf2.png'),
    'onTap': () {
      growableList.add('werewolf');
    },
  },
  {
    'charakter': 'Günstling',
    'image': const AssetImage('assets/Werewolf/guenstling.png'),
    'onTap': () {
      growableList.add('guenstling');
    },
  },
  {
    'charakter': 'Freimaurer',
    'image': const AssetImage('assets/Werewolf/freimaurer.png'),
    'onTap': () {
      growableList.add('freimaurer');
    },
  },
  {
    'charakter': 'Freimaurer',
    'image': const AssetImage('assets/Werewolf/freimaurer.png'),
    'onTap': () {
      growableList.add('freimaurer');
    },
  },
  {
    'charakter': 'Seherin',
    'image': const AssetImage('assets/Werewolf/seherin.png'),
    'onTap': () {
      growableList.add('seherin');
    },
  },
  {
    'charakter': 'Räuber',
    'image': const AssetImage('assets/Werewolf/raeuber.png'),
    'onTap': () {
      growableList.add('raeuber');
    },
  },
  {
    'charakter': 'Unruhestifterin',
    'image': const AssetImage('assets/Werewolf/unruhestifterin1.png'),
    'onTap': () {
      growableList.add('unruhestifterin');
    },
  },
  {
    'charakter': 'Betrunkener',
    'image': const AssetImage('assets/Werewolf/betrunkener.png'),
    'onTap': () {
      growableList.add('betrunkener');
    },
  },
  {
    'charakter': 'Schlaflose',
    'image': const AssetImage('assets/Werewolf/schlaflose2.png'),
    'onTap': () {
      growableList.add('schlaflose');
    },
  },
  {
    'charakter': 'Print',
    'image': const AssetImage('assets/add.png'),
    'onTap': () {
      print(growableList);
    },
  },
];

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: const EdgeInsets.all(50),
      crossAxisSpacing: 100,
      mainAxisSpacing: 100,
      childAspectRatio: (1 / 1.17),
      children: [
        ...charakters.map(
          (e) => GestureDetector(
            onTap: () {
              e['onTap'];
// print('foo');
            },
            child: Column(
              children: [
                Image(
                  image: e['image'],
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
    );
  }
}
