import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';

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
      dense: true,
      contentPadding: AppWidgetStyle.horizontalPaddingMini,
      visualDensity: const VisualDensity(vertical: -4),
      horizontalTitleGap: 2,
      leading: CircleAvatar(
        radius: 15,
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
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '$year год',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
