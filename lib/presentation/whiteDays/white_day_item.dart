import 'package:flutter/material.dart';
import 'package:majmua/application/theme/app_themes.dart';

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
    final appColors = Theme.of(context).colorScheme;
    return CircleAvatar(
      backgroundColor: hijriMonthDay == whiteDay ? appColors.thirdAppColor : appColors.firstAppColor,
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
