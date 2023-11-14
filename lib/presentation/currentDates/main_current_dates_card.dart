import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/currentDates/week_days_row.dart';
import 'package:majmua/presentation/currentDates/year_month_day_card.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class MainCurrentDatesCard extends StatelessWidget {
  const MainCurrentDatesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Consumer<RestTimeState>(
          builder: (BuildContext context, RestTimeState timeState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const WeekDaysRow(),
                const SizedBox(height: 8),
                YearMonthDayCard(
                  monthPercent: timeState.getElapsedMonthPercentage() / 100,
                  day: timeState.currentDateTime.day,
                  month: AppStyles.getMonthName(
                    locale: appLocale!.localeName,
                    number: timeState.currentDateTime.month,
                  ),
                  year: '${timeState.currentDateTime.year} ${appLocale.year.toLowerCase()}',
                  dateColor: appColors.primaryColor,
                ),
                const SizedBox(height: 8),
                YearMonthDayCard(
                  monthPercent: timeState.getElapsedHijriMonthPercentage() / 100,
                  day: timeState.currentHijriTime.hDay,
                  month: AppStyles.getHijriMonthName(
                    locale: appLocale.localeName,
                    number: timeState.currentHijriTime.hMonth,
                  ),
                  year: '${timeState.currentHijriTime.hYear} ${appLocale.year.toLowerCase()}',
                  dateColor: appColors.secondaryColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
