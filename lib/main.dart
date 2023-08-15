import 'package:flutter/material.dart';
import 'package:partygames/models/heading.dart';
import 'package:partygames/models/input.dart';

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
        primaryColor: const Color.fromARGB(255, 6, 165, 33),
        shadowColor: const Color.fromARGB(255, 38, 38, 44),
      ),
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Column(
          children: [
            Heading(
              text: 'Partygames',
              fontSize: 20,
            ),
            Input(
              labelText: 'username',
              password: false,
            ),
          ],
        ),
      ),
    );
  }
}
