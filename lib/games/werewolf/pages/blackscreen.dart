import 'package:flutter/material.dart';

class Blackscreen extends StatelessWidget {
  const Blackscreen({
    super.key,
  });

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
