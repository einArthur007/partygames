import 'package:flutter/material.dart';
import 'package:partygames/pages/games.dart';
import 'package:partygames/pages/signin.dart';
import 'package:partygames/pages/layout.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Adlamd',
        primaryColorLight: const Color.fromARGB(255, 0, 255, 0),
        primaryColorDark: const Color.fromARGB(255, 255, 0, 255),
        scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 29),
        focusColor: const Color.fromARGB(255, 10, 10, 10),
        highlightColor: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: const Color.fromARGB(255, 100, 100, 100),
        hintColor: const Color.fromARGB(255, 150, 150, 150),
        cardColor: const Color.fromARGB(255, 20, 20, 20),
        brightness: Brightness.dark,
      ),
      home: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageCounter = 0;
  Widget? refresh;

  @override
  Widget build(BuildContext context) {
    if (pageCounter == 0) {
      refresh = SignIn(
        setNewPage: () {
          pageCounter++;
          setState(() {});
        },
      );
    }
    if (pageCounter == 1) {
      refresh = Games(
        fontColor: Theme.of(context).primaryColorLight,
      );
    }

    return Stack(
      children: [
        const Layout(heading: 'PartyGames'),
         AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: refresh!,
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ],
    );
  }
}
