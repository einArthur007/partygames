import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

joinRequest(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString('name');
  if (name != '') {
    pageChange = true;
    return;
  }

  // ignore: use_build_context_synchronously
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Theme.of(context).focusColor,
          ),
          child: Center(
            child: Text(
              'Du musste einen Namen wählen, um einem Spiel Bei zu treten',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
        ),
      );
    },
  );
}

bool pageChange = false;

int playerNumber() {
  return 10;
}

int roundCounter() {
  return 10;
}

joinGame() {
  print('joinGame');
}

final werewolfPlayer = List<String>.filled(0, 'Du', growable: true);

int werewolfPageTransition = 0;

double? werewolfTime;
