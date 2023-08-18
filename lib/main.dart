import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:partygames/funktion.dart';
import 'package:partygames/models/button.dart';
import 'package:partygames/models/heading.dart';
import 'package:partygames/models/input.dart';
import 'package:partygames/pages/lobby.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorLight: const Color.fromARGB(255, 0, 255, 0),
        primaryColorDark: Color.fromARGB(255, 255, 0, 255),
        focusColor: const Color.fromARGB(255, 25, 25, 29),
        scaffoldBackgroundColor: const Color.fromARGB(255, 10, 10, 10),
        highlightColor: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: const Color.fromARGB(255, 100, 100, 100),
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getName();
    super.initState();
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    name ??= '';
    input.text = name;
  }

  setName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', input.text);
    print(input.text);
  }

  late Timer timer;
  int counter = 10;

  void timerStart() {
    counter = 10;
//    for (var timerRound = 0; timerRound < 20;) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(counter);
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        counter = 10;
      }
    });
//    if (timerRound == 20) {
//        timer.cancel();
//    }
//  print(timerRound);
//}
  }

  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 80,
                child: IconButton(
                  onPressed: () {},
                  icon:
                      Icon(Icons.menu, color: Theme.of(context).highlightColor),
                  color: Theme.of(context).shadowColor,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Heading(
                  text: 'PartyGames',
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Theme.of(context).focusColor,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.161,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Input(
                    labelText: 'Username',
                    password: false,
                    controller: input,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setName();
                    joinRequest(context);
                    timerStart();
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width / 4,
                          child: const Button(
                            text: 'Join',
                            border: null,
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
