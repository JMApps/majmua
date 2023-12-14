import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/restTimeSeasons/time_percent.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class TimeCircleRow extends StatelessWidget {
  const TimeCircleRow({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<RestTimeState>(
      builder: (BuildContext context, RestTimeState restTimeState, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TimePercent(
                time: appLocale!.day,
                timeColor: appColors.primaryColor,
                percent: restTimeState.getElapsedDayPercentage(),
              ),
            ),
            Expanded(
              child: TimePercent(
                time: appLocale.week,
                timeColor: appColors.quaternaryColor,
                percent: restTimeState.getElapsedWeekPercentage(),
              ),
            ),
            Expanded(
              child: TimePercent(
                time: appLocale.month,
                timeColor: appColors.tertiaryColor,
                percent: restTimeState.getElapsedMonthPercentage(),
              ),
            ),
            Expanded(
              child: TimePercent(
                time: appLocale.year,
                timeColor: appColors.secondaryColor,
                percent: restTimeState.getElapsedYearPercentage(),
              )
            ),
          ],
        );
      },
    );
  }
}
