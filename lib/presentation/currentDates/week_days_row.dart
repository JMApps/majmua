import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/currentDates/week_circle_day.dart';

class WeekDaysRow extends StatelessWidget {
  const WeekDaysRow({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      shape: AppStyles.topShapeMini,
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
    );
  }
}
