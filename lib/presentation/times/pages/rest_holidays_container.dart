import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/time_state.dart';
import '../items/remind_holiday_days_item.dart';
import 'all_hijri_dates.dart';

class RestHolidaysContainer extends StatelessWidget {
  const RestHolidaysContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<TimeState>(
      builder: (context, timeState, _) {
        return Card(
          margin: AppStyles.mardingWithoutTopMini,
          child: Padding(
            padding: AppStyles.mardingVerticalMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RemindHolidayDaysItem(
                  remindTitle: () {
                    if (timeState.isRamadanHoliday()) {
                      return appLocale.congratulationRamadan;
                    } else if (timeState.isRamadan()) {
                      return appLocale.blessedRamadan;
                    } else {
                      return appLocale.daysToRamadan;
                    }
                  }(),
                  remindDays: !timeState.isRamadan() ? timeState.getDaysToHijriDate(hijriMonth: 9, hijriDay: 1, daysKey: AppStringConstraints.mapDaysToRamadan, dateKey: AppStringConstraints.mapRamadanDate,)[AppStringConstraints.mapDaysToRamadan] : timeState.getHijriDateTime.hDay,
                  eventDate: DateFormat('dd.MM.yyyy').format(timeState.getDaysToHijriDate(hijriMonth: 9, hijriDay: 1, daysKey: AppStringConstraints.mapDaysToRamadan, dateKey: AppStringConstraints.mapRamadanDate,)[AppStringConstraints.mapRamadanDate]),
                  itemColor: appColors.primaryContainer,
                  textColor: appColors.primary,
                ),
                const SizedBox(height: 8),
                RemindHolidayDaysItem(
                  remindTitle: () {
                    if (timeState.isDhulhijjahHoliday()) {
                      return appLocale.congratulationDhulHijjah;
                    } else if (timeState.isDhulhijjah()) {
                      return appLocale.dhulHijjah;
                    } else {
                      return appLocale.daysToDhulHujjah;
                    }
                  }(),
                  remindDays: !timeState.isDhulhijjah() ? timeState.getDaysToHijriDate(hijriMonth: 12, hijriDay: 1, daysKey: AppStringConstraints.mapDaysToDhulHijjah, dateKey: AppStringConstraints.mapDhulHijjahDate,)[AppStringConstraints.mapDaysToDhulHijjah] : timeState.getHijriDateTime.hDay,
                  eventDate: DateFormat('dd.MM.yyyy').format(timeState.getDaysToHijriDate(hijriMonth: 12, hijriDay: 1, daysKey: AppStringConstraints.mapDaysToDhulHijjah, dateKey: AppStringConstraints.mapDhulHijjahDate)[AppStringConstraints.mapDhulHijjahDate]),
                  itemColor: appColors.tertiaryContainer,
                  textColor: appColors.tertiary,
                ),
                const SizedBox(height: 8),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => AllHijriDates(),
                    );
                  },
                  title: Text(
                    appLocale.more,
                    style: TextStyle(
                      color: appColors.tertiary,
                    ),
                  ),
                  horizontalTitleGap: 0,
                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  contentPadding: AppStyles.mardingHorizontal,
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
