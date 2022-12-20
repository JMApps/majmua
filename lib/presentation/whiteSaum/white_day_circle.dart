import 'package:flutter/material.dart';

class WhiteDayCircle extends StatelessWidget {
  const WhiteDayCircle({
    Key? key,
    required this.currentHijriDay,
    required this.whiteDay,
  }) : super(key: key);

  final int currentHijriDay;
  final int whiteDay;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: currentHijriDay == whiteDay ? Colors.teal : Colors.red.shade300,
      child: Text(
        '$whiteDay',
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
      ),
    );
  }
}
