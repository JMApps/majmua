import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class ItemDayFromWeek extends StatelessWidget {
  const ItemDayFromWeek({
    Key? key,
    required this.dayNumber,
  }) : super(key: key);

  final int dayNumber;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<RestTimeState>(
      builder: (BuildContext context, restTimeState, _) {
        return CircleAvatar(
          backgroundColor: dayNumber == restTimeState.getCdt.weekday && restTimeState.getCdt.weekday == 5
              ? appColors.thirdAppColor
              : dayNumber == restTimeState.getCdt.weekday
                  ? appColors.secondAppColor
                  : appColors.firstAppColor,
          radius: dayNumber == restTimeState.getCdt.weekday ? 22.5 : 17.5,
          child: Text(
            AppString.shortNamesWeekDay[dayNumber - 1],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }
}
