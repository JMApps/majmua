import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_strings.dart';
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
              dayName: AppStrings.getShortWdName(
                locale: appLocale!.localeName,
                number: AppStrings.monIndex,
              ),
              dayIndex: AppStrings.monIndex,
            ),
            WeekCircleDay(
              dayName: AppStrings.getShortWdName(
                locale: appLocale.localeName,
                number: AppStrings.tueIndex,
              ),
              dayIndex: AppStrings.tueIndex,
            ),
            WeekCircleDay(
              dayName: AppStrings.getShortWdName(
                locale: appLocale.localeName,
                number: AppStrings.wedIndex,
              ),
              dayIndex: AppStrings.wedIndex,
            ),
            WeekCircleDay(
              dayName: AppStrings.getShortWdName(
                locale: appLocale.localeName,
                number: AppStrings.thuIndex,
              ),
              dayIndex: AppStrings.thuIndex,
            ),
            WeekCircleDay(
              dayName: AppStrings.getShortWdName(
                locale: appLocale.localeName,
                number: AppStrings.friIndex,
              ),
              dayIndex: AppStrings.friIndex,
            ),
            WeekCircleDay(
              dayName: AppStrings.getShortWdName(
                locale: appLocale.localeName,
                number: AppStrings.satIndex,
              ),
              dayIndex: AppStrings.satIndex,
            ),
            WeekCircleDay(
              dayName: AppStrings.getShortWdName(
                locale: appLocale.localeName,
                number: AppStrings.sunIndex,
              ),
              dayIndex: AppStrings.sunIndex,
            ),
          ],
        ),
      ),
    );
  }
}
