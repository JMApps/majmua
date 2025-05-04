import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/season.dart';
import '../../../core/enums/time_period.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/time_state.dart';
import '../items/period_time_item.dart';
import '../items/season_item.dart';
import '../widgets/season_name.dart';

class SeasonTimesContainer extends StatelessWidget {
  const SeasonTimesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMardingMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Consumer<TimeState>(
          builder: (context, timeState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: appColors.surface,
                  margin: AppStyles.mardingBottomMini,
                  child: Padding(
                    padding: AppStyles.mainMardingMicroMini,
                    child: Text(
                      appLocale.appSlogan,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PeriodTimeItem(
                      timeIndex: 1,
                      time: appLocale.day,
                      percent: timeState.restPeriodTimes(timePeriod: TimePeriod.day)[AppStringConstraints.elapsedPercentage],
                    ),
                    PeriodTimeItem(
                      timeIndex: 2,
                      time: appLocale.week,
                      percent: timeState.restPeriodTimes(timePeriod: TimePeriod.week)[AppStringConstraints.elapsedPercentage],
                    ),
                    PeriodTimeItem(
                      timeIndex: 3,
                      time: appLocale.month,
                      percent: timeState.restPeriodTimes(timePeriod: TimePeriod.month)[AppStringConstraints.elapsedPercentage],
                    ),
                    PeriodTimeItem(
                      timeIndex: 4,
                      time: appLocale.year,
                      percent: timeState.restPeriodTimes(timePeriod: TimePeriod.year)[AppStringConstraints.elapsedPercentage],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                IgnorePointer(
                  child: Card(
                    child: Padding(
                      padding: AppStyles.mainMardingMicroMini,
                      child: CupertinoSlidingSegmentedControl(
                        groupValue: timeState.getCurrentSeason(),
                        thumbColor: appColors.surface,
                        backgroundColor: appColors.surface,
                        children: <Season, Widget>{
                          Season.spring: timeState.getCurrentSeason() == Season.spring
                              ? SeasonItem(season: Season.spring, seasonName: appLocale.seasonSpring)
                              : SeasonName(seasonName: appLocale.seasonSpring),
                          Season.summer: timeState.getCurrentSeason() == Season.summer
                              ? SeasonItem(season: Season.summer, seasonName: appLocale.seasonSummer)
                              : SeasonName(seasonName: appLocale.seasonSummer),
                          Season.fall: timeState.getCurrentSeason() == Season.fall
                              ? SeasonItem(season: Season.fall, seasonName: appLocale.seasonFall)
                              : SeasonName(seasonName: appLocale.seasonFall),
                          Season.winter: timeState.getCurrentSeason() == Season.winter
                              ? SeasonItem(season: Season.winter, seasonName: appLocale.seasonWinter)
                              : SeasonName(seasonName: appLocale.seasonWinter),
                        },
                        onValueChanged: (Object? value) {},
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
