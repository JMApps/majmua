import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';

class ItemYearMonthDay extends StatelessWidget {
  const ItemYearMonthDay({
    Key? key,
    required this.year,
    required this.month,
    required this.day,
    required this.color,
  }) : super(key: key);

  final int year;
  final String month;
  final int day;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -3),
      horizontalTitleGap: 8,
      leading: CircleAvatar(
        radius: 17.5,
        backgroundColor: color,
        child: Center(
          child: Text(
            '$day',
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Lato',
              color: Colors.white,
            ),
          ),
        ),
      ),
      title: Text(
        month,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '$year ${AppString.year.toLowerCase()}',
        style: const TextStyle(
          fontSize: 13,
          fontFamily: 'Lato'
        ),
      ),
    );
  }
}
