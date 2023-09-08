import 'package:flutter/material.dart';
import 'package:partygames/models/led.dart';
import 'package:partygames/models/heading.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.heading});

final String heading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LED(
          color: Theme.of(context).primaryColorDark,
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: Theme.of(context).focusColor,
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Heading(
                    text: heading,
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
