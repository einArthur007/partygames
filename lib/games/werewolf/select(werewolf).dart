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
    'image': 'freimaurer.png',
  },
  {
    'charakter': 'Freimaurer',
    'image': 'freimaurer.png',
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
  {
    'charakter': 'Print',
    'image': 'assets/add.png',
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
    );
  }
}
