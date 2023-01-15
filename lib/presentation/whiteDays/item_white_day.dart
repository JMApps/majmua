import 'package:flutter/material.dart';

class ItemWhiteDay extends StatelessWidget {
  const ItemWhiteDay({
    Key? key,
    required this.currentDay,
    required this.dayColor,
  }) : super(key: key);

  final int currentDay;
  final Color dayColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: dayColor,
      radius: 17.5,
      child: Text(
        currentDay.toString(),
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Lato',
          color: Colors.white,
        ),
      ),
    );
  }
}
