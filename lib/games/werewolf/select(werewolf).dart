import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

<<<<<<< HEAD
=======
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

>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
              e['onTap'];
              print('foo');
=======
              growableList.add(e['charakter'].toLowerCase());
              setState(() {});
>>>>>>> refs/remotes/origin/main
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
