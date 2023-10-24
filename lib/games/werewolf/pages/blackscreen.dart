import 'package:flutter/material.dart';

class Blackscreen extends StatelessWidget {
  Blackscreen({
    super.key,
    required this.setNewPage,
  });
  Function setNewPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
