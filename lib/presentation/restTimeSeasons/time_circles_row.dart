import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/custom_colors.dart';
import 'package:majmua/presentation/restTimeSeasons/time_percent.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class TimeCircleRow extends StatelessWidget {
  const TimeCircleRow({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<RestTimeState>(
      builder: (BuildContext context, RestTimeState timeState, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TimePercent(
              time: appLocale!.day,
              timeColor: CustomColors.indigo,
              percent: timeState.getElapsedTimePercentage() / 100,
            ),
            TimePercent(
              time: appLocale.week,
              timeColor: CustomColors.red,
              percent: timeState.getElapsedWeekPercentage() / 100,
            ),
            TimePercent(
              time: appLocale.month,
              timeColor: CustomColors.orange,
              percent: timeState.getElapsedMonthPercentage() / 100,
            ),
            TimePercent(
              time: appLocale.year,
              timeColor: CustomColors.teal,
              percent: timeState.getElapsedYearPercentage() / 100,
            ),
          ],
        );
      },
    );
  }
}
