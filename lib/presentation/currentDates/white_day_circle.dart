import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class WhiteDayCircle extends StatelessWidget {
  const WhiteDayCircle({
    super.key,
    required this.dayIndex,
  });

  final int dayIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    return CircleAvatar(
      backgroundColor: dayIndex == timeState.currentHijriTime.hDay
          ? appColors.secondaryColor
          : appColors.primaryColor,
      child: Text(
        dayIndex.toString(),
        style: const TextStyle(
          fontFamily: 'Nexa',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
