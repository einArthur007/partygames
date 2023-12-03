import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    List characterList = [];

    List<Map<String, dynamic>> charakters = [
      {
        'charakter': 'Doppelgänger',
        'image': const AssetImage('assets/Werewolf/doppelgaengerin.png'),
        'onTap': () {
          characterList.add('doppelgaenger');
          setState(() {});
        },
      },
      {
        'charakter': 'Werwolf',
        'image': const AssetImage('assets/Werewolf/werewolf.png'),
        'onTap': () {
          characterList.add('werewolf');
        },
      },
      {
        'charakter': 'Werwolf',
        'image': const AssetImage('assets/Werewolf/werewolf.png'),
        'onTap': () {
          characterList.add('werewolf');
        },
      },
      {
        'charakter': 'Günstling',
        'image': const AssetImage('assets/Werewolf/guenstling.png'),
        'onTap': () {
          characterList.add('guenstling');
        },
      },
      {
        'charakter': 'Freimaurer',
        'image': const AssetImage('assets/Werewolf/freimaurer.png'),
        'onTap': () {
          characterList.add('freimaurer');
        },
      },
      {
        'charakter': 'Freimaurer',
        'image': const AssetImage('assets/Werewolf/freimaurer.png'),
        'onTap': () {
          characterList.add('freimaurer');
        },
      },
      {
        'charakter': 'Seherin',
        'image': const AssetImage('assets/Werewolf/seherin.png'),
        'onTap': () {
          characterList.add('seherin');
        },
      },
      {
        'charakter': 'Räuber',
        'image': const AssetImage('assets/Werewolf/raeuber.png'),
        'onTap': () {
          characterList.add('raeuber');
        },
      },
      {
        'charakter': 'Unruhestifterin',
        'image': const AssetImage('assets/Werewolf/unruhestifterin.png'),
        'onTap': () {
          characterList.add('unruhestifterin');
        },
      },
      {
        'charakter': 'Betrunkener',
        'image': const AssetImage('assets/Werewolf/betrunkener.png'),
        'onTap': () {
          characterList.add('betrunkener');
        },
      },
      {
        'charakter': 'Schlaflose',
        'image': const AssetImage('assets/Werewolf/schlaflose.png'),
        'onTap': () {
          characterList.add('schlaflose');
        },
      },
      {
        'charakter': 'print',
        'image': const AssetImage('assets/add'),
        'onTap': () {
          print(characterList);
        },
      },
    ];

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
              print('foo');
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
                GestureDetector(
                  onTap: () {
                    print(characterList);
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
