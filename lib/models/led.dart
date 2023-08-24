import 'package:flutter/material.dart';


class LED extends StatelessWidget {
  const LED({
    super.key,
    required this.color,
    required this.begin,
    required this.end,
  });

  final Color color;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(

          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: <Color>[
              color,
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
