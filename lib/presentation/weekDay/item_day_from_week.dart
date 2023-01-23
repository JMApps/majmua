import 'package:flutter/material.dart';
import 'package:majmua/application/themes/app_theme.dart';

class ItemDayFromWeek extends StatelessWidget {
  const ItemDayFromWeek({
    Key? key,
    required this.dayName,
    required this.dayNumber,
    required this.weekDay,
  }) : super(key: key);

  final String dayName;
  final int dayNumber;
  final int weekDay;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return CircleAvatar(
      backgroundColor: weekDay == 4
          ? appColors.thirdAppColor
          : dayNumber == weekDay - 1
              ? appColors.secondAppColor
              : appColors.firstAppColor,
      radius: 17.5,
      child: Text(
        dayName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
