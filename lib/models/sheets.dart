import 'package:flutter/material.dart';
import 'package:partygames/models/choosegame/chooseWerewolf.dart';
import 'package:partygames/models/choosegame/chooseDixit.dart';
import 'package:partygames/models/dot.dart';

class BottomSheet1 extends StatefulWidget {
  const BottomSheet1({super.key});

  @override
  State<BottomSheet1> createState() => _BottomSheet1State();
}

class _BottomSheet1State extends State<BottomSheet1> {
  TextEditingController input = TextEditingController();
  final PageController controller = PageController();
  Color color0 = const Color.fromARGB(255, 0, 255, 0);
  Color color1 = const Color.fromARGB(255, 100, 100, 100);
  int pageCount = 1;

  pageNumber(int page) {
    int pageCount = page;
    setState(() {});
    if (pageCount == 0) {
      color0 = Theme.of(context).primaryColorLight;
      setState(() {});
    } else {
      color0 = Theme.of(context).shadowColor;
      setState(() {});
    }
    if (pageCount == 1) {
      color1 = Theme.of(context).primaryColorLight;
      setState(() {});
    } else {
      color1 = Theme.of(context).shadowColor;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: pageNumber,
              children: const [
                ChooseWerewolf(),
                ChooseDixit(),
              ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Dot(color: color0),
                        Dot(color: color1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 100,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopSheet1 extends StatelessWidget {
  const TopSheet1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}