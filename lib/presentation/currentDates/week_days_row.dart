import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/currentDates/week_circle_day.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';

class WeekDaysRow extends StatelessWidget {
  const WeekDaysRow({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    final mediaQuery = MediaQuery.of(context).size.width;
    final circleWidgetSize = mediaQuery * 0.140;
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      child: SquareProgressIndicator(
        width: double.infinity,
        height: circleWidgetSize,
        value: timeState.getElapsedWeekPercentage() / 100,
        borderRadius: 20,
        startPosition: StartPosition.bottomCenter,
        strokeCap: StrokeCap.round,
        clockwise: true,
        color: appColors.secondaryColor,
        emptyStrokeColor: appColors.secondaryColor.withOpacity(0.25),
        strokeWidth: 1.5,
        emptyStrokeWidth: 1.5,
        strokeAlign: SquareStrokeAlign.center,
        child: Padding(
          padding: AppStyles.mainMardingMini,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeekCircleDay(
                dayName: AppStyles.getShortWdName(
                  locale: appLocale!.localeName,
                  number: AppStyles.monIndex,
                ),
                dayIndex: AppStyles.monIndex,
              ),
              WeekCircleDay(
                dayName: AppStyles.getShortWdName(
                  locale: appLocale.localeName,
                  number: AppStyles.tueIndex,
                ),
                dayIndex: AppStyles.tueIndex,
              ),
              WeekCircleDay(
                dayName: AppStyles.getShortWdName(
                  locale: appLocale.localeName,
                  number: AppStyles.wedIndex,
                ),
                dayIndex: AppStyles.wedIndex,
              ),
              WeekCircleDay(
                dayName: AppStyles.getShortWdName(
                  locale: appLocale.localeName,
                  number: AppStyles.thuIndex,
                ),
                dayIndex: AppStyles.thuIndex,
              ),
              WeekCircleDay(
                dayName: AppStyles.getShortWdName(
                  locale: appLocale.localeName,
                  number: AppStyles.friIndex,
                ),
                dayIndex: AppStyles.friIndex,
              ),
              WeekCircleDay(
                dayName: AppStyles.getShortWdName(
                  locale: appLocale.localeName,
                  number: AppStyles.satIndex,
                ),
                dayIndex: AppStyles.satIndex,
              ),
              WeekCircleDay(
                dayName: AppStyles.getShortWdName(
                  locale: appLocale.localeName,
                  number: AppStyles.sunIndex,
                ),
                dayIndex: AppStyles.sunIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
