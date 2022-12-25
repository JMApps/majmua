import 'package:flutter/material.dart';

class WhiteDayItem extends StatelessWidget {
  const WhiteDayItem({
    Key? key,
    required this.hijriMonthDay,
    required this.whiteDay,
  }) : super(key: key);

  final int hijriMonthDay;
  final int whiteDay;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: hijriMonthDay == whiteDay ? Colors.deepOrange : Colors.indigo,
      radius: 15,
      child: Text(
        '$whiteDay',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
