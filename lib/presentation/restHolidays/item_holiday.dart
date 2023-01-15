import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';

class ItemHoliday extends StatelessWidget {
  const ItemHoliday({
    Key? key,
    required this.holidayName,
    required this.days,
    required this.color,
  }) : super(key: key);

  final String holidayName;
  final int days;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppWidgetStyle.mainRectangleBorder,
      margin: EdgeInsets.zero,
      child: ListTile(
        trailing: CircleAvatar(
          radius: 17.5,
          backgroundColor: color,
          child: Center(
            child: Text(
              days.toString().substring(1),
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Lato',
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          holidayName,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
