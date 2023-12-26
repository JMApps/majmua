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
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    return CircleAvatar(
      radius: screenWidth * 0.045,
      backgroundColor: dayIndex == timeState.currentHijriTime.hDay
          ? appColors.quaternaryColor
          : appColors.primaryColor,
      child: Text(
        dayIndex.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.040,
          fontFamily: 'Bitter',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
