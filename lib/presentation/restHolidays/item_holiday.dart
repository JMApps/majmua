import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';

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
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -2),
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
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Nexa',
            color: appColors.mainTextColor,
          ),
        ),
      ),
    );
  }
}
