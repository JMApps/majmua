import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../state/time_state.dart';
import '../items/ayah_hadith_day_item.dart';
import '../items/remind_holiday_days_item.dart';

class RestHolidaysContainer extends StatelessWidget {
  const RestHolidaysContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 8,
                    child: RemindHolidayDaysItem(
                      remindTitle: appLocale.daysToRamadan,
                      remindDays: timeState.getDaysToRamadan()[AppStringConstraints.mapDaysToRamadan],
                      eventDate: DateFormat('dd.MM.yyyy').format(timeState.getDaysToRamadan()[AppStringConstraints.mapRamadanDate]),
                      percentage: timeState.getDaysToRamadan()[AppStringConstraints.mapPercentageToRamadan],
                      itemColor: appColors.primaryContainer,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AyahHadithDayItem(
                      title: appLocale.ayahDay,
                      color: appColors.primaryContainer,
                      onTap: () {
                        HapticFeedback.lightImpact();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 8,
                    child: RemindHolidayDaysItem(
                      remindTitle: appLocale.daysToDhulHujjah,
                      remindDays: timeState.getDaysToDhulHijjah()[AppStringConstraints.mapDaysToDhulHijjah],
                      eventDate: DateFormat('dd.MM.yyyy').format(timeState.getDaysToDhulHijjah()[AppStringConstraints.mapDhulHijjahDate]),
                      percentage: timeState.getDaysToDhulHijjah()[AppStringConstraints.mapPercentageToDhulHijjah],
                      itemColor: appColors.tertiaryContainer,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AyahHadithDayItem(
                      title: appLocale.hadithDay,
                      color: appColors.tertiaryContainer,
                      onTap: () {
                        HapticFeedback.lightImpact();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
