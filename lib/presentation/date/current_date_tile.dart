import 'package:flutter/material.dart';

class CurrentDateTile extends StatelessWidget {
  const CurrentDateTile({
    Key? key,
    required this.currentYear,
    required this.currentMonth,
    required this.currentDay,
    required this.color,
  }) : super(key: key);

  final int currentYear;
  final String currentMonth;
  final int currentDay;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 8,
      title: Text(
        currentMonth,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        '$currentYear год',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: Text(
          '$currentDay',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
