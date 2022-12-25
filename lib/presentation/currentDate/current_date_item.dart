import 'package:flutter/material.dart';
import 'package:majmua/application/theme/app_themes.dart';

class CurrentDateItem extends StatelessWidget {
  const CurrentDateItem({
    Key? key,
    required this.currentMonth,
    required this.currentYear,
    required this.currentDay,
    required this.color,
  }) : super(key: key);

  final String currentMonth;
  final int currentYear;
  final int currentDay;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 8,
      title: Text(
        currentMonth,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: appColors.mainTextColor,
        ),
      ),
      subtitle: Text(
        '$currentYear год',
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Lato'
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
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }
}
