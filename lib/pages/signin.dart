import 'package:flutter/material.dart';
import 'package:partygames/funktion.dart';
import 'package:partygames/models/input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:partygames/models/button.dart';
import 'package:partygames/models/led.dart';

class SignIn extends StatefulWidget {
  SignIn({
    super.key,
    required this.setNewPage,
  });

  Function setNewPage;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
  }

  pageSwitch() {
    if (pageChange) {
      widget.setNewPage();
    }
  }

  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              LED(
                color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1,
                ),
                child: Button(
                  text: 'Join',
                  border: null,
                  onTap: () async {
                    setName();
                    await joinRequest(context);
                    pageSwitch();
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Input(
                    labelText: 'Dein Name',
                    hintText: 'z.B. Peter Pan',
                    password: false,
                    controller: input,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
